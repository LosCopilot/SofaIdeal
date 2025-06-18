using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOFAIDEAL
{
    public partial class WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
                UpdateCartBadge();
            }
        }

        private void LoadProducts()
        {
            // Datos de ejemplo (en un caso real vendrían de una base de datos)
            var products = new List<dynamic>
            {
                new { IDProducto = 1, NombreProducto = "Sofá Clásico", Precio = 1899.99m, Stock = 15, ImagenURL = "sofa1.jpg" },
                new { IDProducto = 2, NombreProducto = "Sofá Moderno", Precio = 2199.99m, Stock = 8, ImagenURL = "sofa2.jpg" },
                new { IDProducto = 3, NombreProducto = "Sofá Seccional", Precio = 3499.99m, Stock = 5, ImagenURL = "sofa3.jpg" }
            };

            rptProducts.DataSource = products;
            rptProducts.DataBind();
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
                int quantity = Convert.ToInt32(txtQuantity.Text);

                AddToCart(productId, quantity);
                UpdateCartBadge();
            }
        }

        private void AddToCart(int productId, int quantity)
        {
            DataTable cart = GetCart();
            DataRow[] rows = cart.Select($"IDProducto = {productId}");

            if (rows.Length > 0)
            {
                rows[0]["Cantidad"] = Convert.ToInt32(rows[0]["Cantidad"]) + quantity;
            }
            else
            {
                // Obtener producto de la "base de datos"
                var product = GetProductById(productId);

                DataRow newRow = cart.NewRow();
                newRow["IDProducto"] = productId;
                newRow["NombreProducto"] = product.NombreProducto;
                newRow["Precio"] = product.Precio;
                newRow["Cantidad"] = quantity;
                newRow["Subtotal"] = product.Precio * quantity;
                cart.Rows.Add(newRow);
            }

            Session["Cart"] = cart;
        }

        private dynamic GetProductById(int productId)
        {
            // Simulación de obtención de producto de DB
            return new { IDProducto = productId, NombreProducto = "Sofá Ejemplo", Precio = 1500.00m };
        }

        private DataTable GetCart()
        {
            if (Session["Cart"] == null)
            {
                DataTable cart = new DataTable();
                cart.Columns.Add("IDProducto", typeof(int));
                cart.Columns.Add("NombreProducto", typeof(string));
                cart.Columns.Add("Precio", typeof(decimal));
                cart.Columns.Add("Cantidad", typeof(int));
                cart.Columns.Add("Subtotal", typeof(decimal), "Precio * Cantidad");
                Session["Cart"] = cart;
            }
            return (DataTable)Session["Cart"];
        }

        private void UpdateCartBadge()
        {
            DataTable cart = GetCart();
            int totalItems = cart.AsEnumerable().Sum(row => Convert.ToInt32(row["Cantidad"]));
            cartBadge.InnerText = totalItems.ToString();
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                DataTable cart = GetCart();
                cart.Rows.RemoveAt(rowIndex);
                Session["Cart"] = cart;
                gvCart.DataBind();
                UpdateCartBadge();
            }
            else if (e.CommandName == "Update")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvCart.Rows[rowIndex];
                TextBox txtQuantity = (TextBox)row.FindControl("txtCartQuantity");
                int newQuantity = Convert.ToInt32(txtQuantity.Text);

                DataTable cart = GetCart();
                cart.Rows[rowIndex]["Cantidad"] = newQuantity;
                Session["Cart"] = cart;
                gvCart.DataBind();
                UpdateCartBadge();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Lógica para procesar el pago
        }

        protected void btnConfirmOrder_Click(object sender, EventArgs e)
        {
            // Lógica para confirmar el pedido
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            // ... procesar datos del cliente

            // Limpiar carrito después de confirmar
            Session["Cart"] = null;
            UpdateCartBadge();
            ScriptManager.RegisterStartupScript(this, GetType(), "showAlert",
                "alert('¡Pedido confirmado con éxito!');", true);
        }

        protected void gvCart_DataBinding(object sender, EventArgs e)
        {
            gvCart.DataSource = GetCart();
        }
    }
}