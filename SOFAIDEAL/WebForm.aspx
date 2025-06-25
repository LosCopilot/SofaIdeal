<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="SOFAIDEAL.WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sofá Ideal - E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <style>
        :root {
            --primary-color: #2A5C8B;
            --secondary-color: #F5F0E6;
            --accent-color: #4CAF50;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }
        
        .navbar {
            background-color: var(--primary-color);
        }
        
        .navbar-brand {
            font-weight: bold;
            color: white !important;
        }
        
        .nav-link {
            color: rgba(255, 255, 255, 0.85) !important;
            transition: all 0.3s ease;
         }

        .nav-link:hover,
        .nav-link.active {
             color: #ffffff !important;
             text-decoration: underline;
         }

        .dropdown-menu {
            font-size: 0.95rem;
        }

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/hero-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            margin-bottom: 30px;
        }
        
        .product-card {
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        
        .product-img {
            height: 200px;
            object-fit: cover;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-success {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }
        
        .footer {
            background-color: var(--primary-color);
            color: white;
            padding: 30px 0;
            margin-top: 50px;
        }
        
        .cart-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            font-size: 0.7rem;
        }
        
        .quantity-control {
            width: 100px;
        }
        
        /* NEW: About Section Styles */
        .about-section {
            padding: 80px 0;
            background-color: #fff;
        }
        
        .section-title {
            position: relative;
            padding-bottom: 20px;
            margin-bottom: 40px;
            text-align: center;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: var(--primary-color);
        }
        
        .mission-vision-box {
            background: var(--secondary-color);
            padding: 30px;
            border-radius: 10px;
            height: 100%;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .values-list {
            list-style-type: none;
            padding-left: 0;
        }
        
        .values-list li {
            padding: 10px 0;
            border-bottom: 1px dashed #ddd;
        }
        
        .values-list li:last-child {
            border-bottom: none;
        }
        
        .values-list li i {
            color: var(--primary-color);
            margin-right: 10px;
        }
        
        .gallery-item {
            position: relative;
            margin-bottom: 30px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .gallery-item img {
            transition: transform 0.5s;
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        
        .gallery-item:hover img {
            transform: scale(1.1);
        }
        
        .gallery-caption {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(42, 92, 139, 0.85);
            color: white;
            padding: 15px;
            transform: translateY(100%);
            transition: transform 0.3s;
        }
        
        .gallery-item:hover .gallery-caption {
            transform: translateY(0);
        }
        
        .about-logo {
            max-width: 200px;
            margin: 0 auto 30px;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top shadow-sm" style="background-color: #2A5C8B;">
            <div class="container">
                <a class="navbar-brand fw-bold" href="#">
                  <i class="fas fa-couch me-2"></i> Sofá Ideal
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                   <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                   <!-- Secciones principales -->
                   <ul class="navbar-nav me-auto">
                     <li class="nav-item">
                       <a class="nav-link active" href="#">Inicio</a>
                     </li>
                     <li class="nav-item">
                       <a class="nav-link" href="#products">Catálogo</a>
                     </li>
                     <li class="nav-item">
                       <a class="nav-link" href="#about-section">Nosotros</a>
                     </li>
                     <li class="nav-item">
                       <a class="nav-link" href="#contact-section">Contacto</a>
                     </li>
                 </ul> 


            <!-- Mi Cuenta y Carrito -->
                    <!-- Barra de Búsqueda -->
    <li class="nav-item me-3">
        <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Buscar productos..." />
    </li>
                    <!-- Mensaje de no resultados -->
                <li class="nav-item position-relative">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#cartModal">
                        <i class="fas fa-shopping-cart"></i>
                        <span id="cartBadge" runat="server" class="badge bg-danger cart-badge">0</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

        <!-- Hero Section -->
        <section class="hero-section text-center">
            <div class="container">
                <h1 class="display-4 fw-bold mb-4">Sofás Artesanales de Alta Calidad</h1>
                <p class="lead mb-5">Diseñados para tu comodidad y estilo de vida</p>
                <a href="#products" class="btn btn-success btn-lg px-4 me-2">Ver Catálogo</a>
                <a href="#" class="btn btn-outline-light btn-lg px-4">Personalizar</a>
            </div>
        </section>

        <!-- NEW: About Section -->
        <section id="about-section" class="about-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-12 text-center">
                        <img src="Logo (2).png" alt="Sofá Ideal" class="about-logo">
                        <h2 class="section-title">Nuestra Empresa</h2>
                    </div>
                </div>
                
                <div class="row mb-5">
                    <div class="col-lg-6 mb-4 mb-lg-0">
                        <div class="mission-vision-box">
                            <h3 class="mb-4"><i class="fas fa-bullseye me-2"></i>Misión</h3>
                            <p class="mb-4">Diseñar y fabricar sofás de máxima calidad que combinen confort, estilo y durabilidad, ofreciendo soluciones personalizadas que se adapten a las necesidades y gustos de cada cliente, siempre con un servicio excepcional.</p>
                            
                            <h3 class="mb-4"><i class="fas fa-eye me-2"></i>Visión</h3>
                            <p>Ser reconocidos como la marca líder en diseño y fabricación de muebles de descanso en Perú, expandiendo nuestra presencia a nivel internacional y siendo referentes en innovación y sostenibilidad en el sector.</p>
                        </div>
                    </div>
                    
                    <div class="col-lg-6">
                        <div class="mission-vision-box">
                            <h3 class="mb-4"><i class="fas fa-heart me-2"></i>Valores</h3>
                            <ul class="values-list">
                                <li><i class="fas fa-check-circle"></i> <strong>Calidad:</strong> Excelencia en materiales y procesos de fabricación</li>
                                <li><i class="fas fa-check-circle"></i> <strong>Innovación:</strong> Diseños vanguardistas y funcionales</li>
                                <li><i class="fas fa-check-circle"></i> <strong>Sostenibilidad:</strong> Materiales ecológicos y procesos responsables</li>
                                <li><i class="fas fa-check-circle"></i> <strong>Servicio:</strong> Atención personalizada y soluciones a medida</li>
                                <li><i class="fas fa-check-circle"></i> <strong>Pasión:</strong> Amor por el diseño y la artesanía en cada pieza</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="row mb-5">
                    <div class="col-12">
                        <h3 class="text-center mb-4">Quiénes Somos</h3>
                        <p class="text-center lead mb-5">
                            Sofá Ideal es una empresa peruana con más de 15 años de experiencia en el diseño y fabricación de muebles de alta calidad. 
                            Especializados en sofás y sillones, combinamos técnicas artesanales con tecnología de vanguardia para crear piezas únicas 
                            que transforman espacios en lugares acogedores y llenos de estilo. Nuestro compromiso es ofrecer productos que superen 
                            las expectativas de nuestros clientes en confort, diseño y durabilidad.
                        </p>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-12">
                        <h3 class="text-center mb-5">Nuestro Mundo</h3>
                    </div>
                </div>
                
                <div class="row">
                    <!-- Gallery Images -->
                    <div class="col-md-4 mb-4">
                        <div class="gallery-item">
                            <img src="taller de produccion .png" alt="Nuestras Instalaciones">
                            <div class="gallery-caption">
                                <h5>Taller de Producción</h5>
                                <p class="mb-0">Espacio donde creamos cada pieza con dedicación</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-4">
                        <div class="gallery-item">
                            <img src="Equipo Especializado.png" alt="Nuestro Equipo">
                            <div class="gallery-caption">
                                <h5>Equipo Especializado</h5>
                                <p class="mb-0">Artisans con más de 10 años de experiencia</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-4">
                        <div class="gallery-item">
                            <img src="Materiales 1.jpg" alt="Materiales">
                            <div class="gallery-caption">
                                <h5>Materiales Premium</h5>
                                <p class="mb-0">Selección de telas y materiales de primera calidad</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6 mb-4">
                        <div class="gallery-item">
                            <img src="Proceso de Diseño.png" alt="Diseño">
                            <div class="gallery-caption">
                                <h5>Proceso de Diseño</h5>
                                <p class="mb-0">Creación de prototipos y modelos exclusivos</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6 mb-4">
                        <div class="gallery-item">
                            <img src="Showroom Principal.jpg" alt="Showroom">
                            <div class="gallery-caption">
                                <h5>Showroom Principal</h5>
                                <p class="mb-0">Espacio donde puedes experimentar nuestros productos</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row mt-5">
                    <div class="col-md-6 mx-auto">
                        <div class="card border-0 shadow">
                            <div class="card-body text-center p-4">
                                <h4 class="mb-4">Contáctanos</h4>
                                <p><i class="fas fa-map-marker-alt me-2"></i> Av. Los Artesanos 123, Lima, Perú</p>
                                <p><i class="fas fa-phone me-2"></i> (01) 987-654321</p>
                                <p><i class="fas fa-envelope me-2"></i> info@sofaideal.com</p>
                                <p><i class="fas fa-clock me-2"></i> Lunes a Viernes: 9:00 AM - 6:00 PM</p>
                                <a href="#" class="btn btn-primary mt-3">Enviar Mensaje</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main Content -->
        <div class="container">
            <!-- Featured Products -->
            <section id="products" class="mb-5">
                <h2 class="text-center mb-4">Nuestros Productos Destacados</h2>
                <div class="row">
                    <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                        <ItemTemplate>
                            <div class="col-md-4 mb-4">
                                <div class="card product-card h-100">
                                    <img src='<%# Eval("ImagenURL", "images/products/{0}") %>' class="card-img-top product-img" alt='<%# Eval("NombreProducto") %>'/>
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("NombreProducto") %></h5>
                                        <p class="card-text text-muted">Disponibles: <%# Eval("Stock") %></p>
                                        <h4 class="text-primary">S/ <%# Eval("Precio", "{0:N2}") %></h4>
                                    </div>
                                    <div class="card-footer bg-white">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="input-group quantity-control">
                                                <button class="btn btn-outline-secondary minus-btn" type="button">-</button>
                                                <asp:TextBox runat="server" ID="txtQuantity" Text="1" CssClass="form-control text-center quantity-input" 
                                                    TextMode="Number" min="1" max='<%# Eval("Stock") %>'/>
                                                <button class="btn btn-outline-secondary plus-btn" type="button">+</button>
                                            </div>
                                            <asp:LinkButton runat="server" CommandName="AddToCart" CommandArgument='<%# Eval("IDProducto") %>' 
                                                CssClass="btn btn-primary">
                                                <i class="fas fa-cart-plus me-1"></i>Añadir
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </section>

            <!-- Categories -->
            <section class="mb-5">
                <h2 class="text-center mb-4">Categorías</h2>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card category-card">
                            <img src="sofa clasico.jpg" class="card-img-top" alt="Sofás Clásicos"/>
                            <div class="card-body text-center">
                                <h5 class="card-title">Clásicos</h5>
                                <a href="#" class="btn btn-outline-primary">Ver más</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card category-card">
                            <img src="Sofás Modernos.jpg" class="card-img-top" alt="Sofás Modernos"/>
                            <div class="card-body text-center">
                                <h5 class="card-title">Modernos</h5>
                                <a href="#" class="btn btn-outline-primary">Ver más</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card category-card">
                            <img src="Sofás Personalizados.jpg" class="card-img-top" alt="Sofás Personalizados"/>
                            <div class="card-body text-center">
                                <h5 class="card-title">Personalizados</h5>
                                <a href="#" class="btn btn-outline-primary">Ver más</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- Testimonials -->
        <section class="bg-light py-5">
            <div class="container">
                <h2 class="text-center mb-5">Lo que dicen nuestros clientes</h2>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="mb-3 text-warning">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <p class="card-text">"El sofá que encargué superó mis expectativas. La calidad es excelente y el servicio al cliente fue impecable."</p>
                            </div>
                            <div class="card-footer bg-white">
                                <div class="d-flex align-items-center">
                                    <img src="4.png" class="rounded-circle me-3" width="50" alt="Cliente"/>
                                    <div>
                                        <h6 class="mb-0">María González</h6>
                                        <small class="text-muted">Lima</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="mb-3 text-warning">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <p class="card-text">"Me encantó poder personalizar cada detalle de mi sofá. El resultado final es exactamente como lo imaginé."</p>
                            </div>
                            <div class="card-footer bg-white">
                                <div class="d-flex align-items-center">
                                    <img src="3.jpg" class="rounded-circle me-3" width="50" alt="Cliente"/>
                                    <div>
                                        <h6 class="mb-0">Carlos Mendoza</h6>
                                        <small class="text-muted">Arequipa</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="mb-3 text-warning">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <p class="card-text">"Excelente relación calidad-precio. Lo recomiendo a todos mis amigos y familiares."</p>
                            </div>
                            <div class="card-footer bg-white">
                                <div class="d-flex align-items-center">
                                    <img src="1 .png" class="rounded-circle me-3" width="50" alt="Cliente"/>
                                    <div>
                                        <h6 class="mb-0">Lucía Fernández</h6>
                                        <small class="text-muted">Trujillo</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer" id="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-4 mb-md-0">
                        <h5>Sofá Ideal</h5>
                        <p>Fabricantes de sofás artesanales con más de 10 años de experiencia en el mercado.</p>
                        <div class="social-icons">
                            <a href="#" class="text-white me-2"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="text-white me-2"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="text-white me-2"><i class="fab fa-whatsapp"></i></a>
                        </div>
                    </div>
                    <div class="col-md-2 mb-4 mb-md-0">
                        <h5>Enlaces</h5>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-white">Inicio</a></li>
                            <li><a href="#products" class="text-white">Catálogo</a></li>
                            <li><a href="#about-section" class="text-white">Nosotros</a></li>
                            <li><a href="#" class="text-white">Contacto</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 mb-4 mb-md-0">
                        <h5>Contacto</h5>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-map-marker-alt me-2"></i> Av. Los Sofás 123, Lima</li>
                            <li><i class="fas fa-phone me-2"></i> (01) 987654321</li>
                            <li><i class="fas fa-envelope me-2"></i> info@sofaideal.com</li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h5>Newsletter</h5>
                        <p>Suscríbete para recibir nuestras ofertas especiales.</p>
                        <div class="input-group mb-3">
                            <input type="email" class="form-control" placeholder="Tu correo"/>
                            <button class="btn btn-success" type="button">Suscribir</button>
                        </div>
                    </div>
                </div>
                <hr class="my-4 bg-light"/>
                <div class="text-center">
                    <p class="mb-0">&copy; 2023 Sofá Ideal. Todos los derechos reservados.</p>
                </div>
            </div>
        </footer>

        <!-- Cart Modal -->
        <div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cartModalLabel">Mi Carrito</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="table" 
                            OnRowCommand="gvCart_RowCommand" ShowFooter="True" DataKeyNames="IDProducto">
                            <Columns>
                                <asp:BoundField DataField="NombreProducto" HeaderText="Producto"/>
                                <asp:BoundField DataField="Precio" HeaderText="Precio Unitario" DataFormatString="{0:C}"/>
                                <asp:TemplateField HeaderText="Cantidad">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtCartQuantity" runat="server" Text='<%# Eval("Cantidad") %>' 
                                            TextMode="Number" min="1" CssClass="form-control quantity-input" Width="70px"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}"/>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="Remove" CommandArgument='<%# Container.DataItemIndex %>' 
                                            CssClass="btn btn-danger btn-sm">
                                            <i class="fas fa-trash-alt"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" CommandName="Update" CommandArgument='<%# Container.DataItemIndex %>' 
                                            CssClass="btn btn-primary btn-sm">
                                            <i class="fas fa-sync-alt"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle Font-Bold="True" CssClass="table-active"/>
                        </asp:GridView>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Seguir Comprando</button>
                        <asp:Button ID="btnCheckout" runat="server" Text="Finalizar Compra" CssClass="btn btn-success" OnClick="btnCheckout_Click"/>
                    </div>
                </div>
            </div>
        </div>

        <!-- Checkout Modal -->
        <div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="checkoutModalLabel">Finalizar Compra</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombres</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtApellido" class="form-label">Apellidos</label>
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtDNI" class="form-label">DNI</label>
                            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" TextMode="Number" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtTelefono" class="form-label">Teléfono</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" TextMode="Phone" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtDireccion" class="form-label">Dirección de Envío</label>
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtNotas" class="form-label">Notas adicionales</label>
                            <asp:TextBox ID="txtNotas" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirmar Pedido" CssClass="btn btn-success" OnClick="btnConfirmOrder_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Quantity controls
        document.querySelectorAll('.plus-btn').forEach(button => {
            button.addEventListener('click', function () {
                const input = this.parentNode.querySelector('.quantity-input');
                input.value = parseInt(input.value) + 1;
            });
        });

        document.querySelectorAll('.minus-btn').forEach(button => {
            button.addEventListener('click', function () {
                const input = this.parentNode.querySelector('.quantity-input');
                if (parseInt(input.value) > 1) {
                    input.value = parseInt(input.value) - 1;
                }
            });
        });

        // Show checkout modal when cart modal is hidden if checkout button was clicked
        var checkoutModal = new bootstrap.Modal(document.getElementById('checkoutModal'));
        var cartModal = document.getElementById('cartModal');
        cartModal.addEventListener('hidden.bs.modal', function (event) {
            if (event.relatedTarget && event.relatedTarget.id === 'btnCheckout') {
                checkoutModal.show();
            }
        });
    </script>
 <script>
     document.getElementById("searchInput").addEventListener("keyup", function () {
         const searchTerm = this.value.toLowerCase().trim();

         let foundResult = false;

         // Filtrar productos
         const productCards = document.querySelectorAll(".product-card");
         productCards.forEach(card => {
             const productName = card.querySelector(".card-title").textContent.toLowerCase();
             if (productName.includes(searchTerm)) {
                 card.closest('.col-md-4').style.display = "block";
                 foundResult = true;
             } else {
                 card.closest('.col-md-4').style.display = "none";
             }
         });

         // Filtrar categorías
         const categoryCards = document.querySelectorAll(".category-card");
         categoryCards.forEach(card => {
             const categoryName = card.querySelector(".card-title").textContent.toLowerCase();
             if (categoryName.includes(searchTerm)) {
                 card.closest('.col-md-4').style.display = "block";
                 foundResult = true;
             } else {
                 card.closest('.col-md-4').style.display = "none";
             }
         });

         // Mostrar/Ocultar mensaje según si hay resultados
         const noResults = document.getElementById("noResults");
         if (searchTerm.length > 0 && !foundResult) {
             noResults.classList.remove("d-none");
         } else {
             noResults.classList.add("d-none");
         }
     });
    </script>

</body>
</html>