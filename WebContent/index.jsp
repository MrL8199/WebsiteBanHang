<%@page import="dao.AuthorDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.PublisherDAO"%>
<%@page import="model.Author"%>
<%@page import="model.Category"%>
<%@page import="model.Publisher"%>
<%@page import="java.util.Map"%>
<%@page import="dao.BookDAO"%>
<%@page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Map<String, Book> mapListProduct = BookDAO.mapSanPham;
	Map<String, Publisher> mapListPublisher = PublisherDAO.mapPublisher;
	Map<String, Category> mapListCategory = CategoryDAO.mapLoaiSanPham;
	Map<String, Author> mapListAuthor = AuthorDAO.mapTacGia;

	int pageN = (request.getAttribute("pageNumber")==null)?1:(int)request.getAttribute("pageNumber");

	Map<String, Book> mapListProductByPage = BookDAO.laySachTheoTrang(pageN);

	int totalPage = mapListProduct.size();
	int totalP;
	if(totalPage % 9 == 0){
		totalP = totalPage % 9;
	} else {
		totalP = totalPage / 9 + 1;
	}

	Map<String, Book> mapListProductBuyMax = BookDAO.laySachMuaNhieuNhat();
%>
<%!
	public String percentBook(String a, String b) {
		float x = Float.parseFloat(a);  	
		float y = Float.parseFloat(b);
		String result = Float.toString((long)(100-(x*100/y)));
     	return result.substring(0, result.indexOf("."));
  	}
%>
<%!
	public String formatMoney(String a) {
		float x = Float.parseFloat(a);  
		String result = String.format("%,.0f", x);
     	return result;
  	}
%>
<%
	String notify = (String)request.getAttribute("success");
	if(notify != null){
		out.print("<script>arlet('"+notify+"')</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Trang chủ</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<!--fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<!--//slider-script-->
<script>
	$(document).ready(function(c) {
		$('.alert-close').on('click', function(c) {
			$('.message').fadeOut('slow', function(c) {
				$('.message').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close1').on('click', function(c) {
			$('.message1').fadeOut('slow', function(c) {
				$('.message1').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close2').on('click', function(c) {
			$('.message2').fadeOut('slow', function(c) {
				$('.message2').remove();
			});
		});
	});
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>

</head>
<body>
	<!--header-->
	<div class="container">
		<!-- header-top -->
		<jsp:include page="header/header-top.jsp"></jsp:include>
		<!-- header-top -->
		<!-- header-bottom -->
		<jsp:include page="header/header-bottom.jsp"></jsp:include>
		<!-- header-bottom -->

		<div class="content">

			<div class="col-md-9">
				<div class="shoe">
					<img class="img-responsive" src="images/banner_02.jpg" alt="">
					<div class="shop">
						<h4>
							SHOP<span>BOOK</span>
						</h4>
						<p>2020</p>
					</div>
				</div>
				<div class="content-bottom">
					<h3>Featured products</h3>
					<div class="bottom-grid">
						<%
							int count = 0;
							for (Book sp : mapListProductByPage.values()) {
								count++;
						%>
						<div class="col-md-4 shirt" style="margin-bottom: 20px">
							<div class="bottom-grid-top">
								<a href="Book?id=<%=sp.getId()%>&func=Detail"> 
									<img style="height: 200px" src="<%=sp.getPicture()%>" class="img-responsive" alt="">
									<div class="five">
										<h6>- <%=percentBook(sp.getSale_price(), sp.getPrice())%>%</h6>
									</div>
									<div class="pre">
										<p><%=sp.getTitle()%></p>
										<span>
											<%=formatMoney(sp.getPrice())%>₫
										</span>
										<div class="clearfix"></div>
									</div></a>
							</div>
						</div>
						<%
							}
						%>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<div class="demo">
					<nav class="pagination-outer" aria-label="Page navigation">
						<ul class="pagination">
							<%if(pageN == 1){ %>
								<li class="page-item"><a href="Book?page=<%=pageN %>" class="page-link"
									aria-label="Previous"> <span aria-hidden="true">«</span>
								</a></li>
							<%} else { %>
								<li class="page-item"><a href="Book?page=<%=pageN-1 %>" class="page-link"
									aria-label="Previous"> <span aria-hidden="true">«</span>
								</a></li>
							<% } %>
							<li class="page-item" style="display: flex; justify-content: center; align-items: center; font-size: 18px; color: #fe1739;">
								<p><% out.print(pageN);%></p>
							</li>
							<li class="page-item"><a href="Book?page=<%=pageN+1 %>" class="page-link"
								aria-label="Next"> <span aria-hidden="true">»</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>

			<div class="col-md-3 col-md">
				<div class=" possible-about">
					<h4>BỘ LỌC TÌM KIẾM</h4>
					<div class="tab1">
						<ul class="place">
							<li class="sort"><span>Khoảng giá</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="single-bottom">
							<a href="Book?search=>500&func=filter"> <input type="checkbox" id="brand" value="">
								<label for="brand"><span></span><b>500.000₫ - Lớn
										hơn</b></label>
							</a> <a href="Book?search=400-500&func=filter"> <input type="checkbox" id="brand1" value="">
								<label for="brand1"><span></span> <b>500.000₫ -
										400.000₫</b></label>
							</a> <a href="Book?search=200-400&func=filter"> <input type="checkbox" id="brand2" value="">
								<label for="brand2"><span></span> <b>400.000₫ -
										200.000₫</b></label>
							</a> <a href="Book?search=50-200&func=filter"> <input type="checkbox" id="brand3" value="">
								<label for="brand3"><span></span> <b>200.000₫ -
										50.000₫</b></label>
							</a> <a href="Book?search=<50&func=filter"> <input type="checkbox" id="brand4" value="">
								<label for="brand4"><span></span><b>50.000₫ - Thấp
										hơn</b></label>
							</a>
						</div>
					</div>

					<div class="tab2">
						<ul class="place">
							<li class="sort"><span>Thể loại</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="single-bottom">
							<%
								for (Category category : mapListCategory.values()) {
							%>
							<a href="Book?search=<%=category.getName() %>&func=filter"> <input type="checkbox" id="nike" value="">
								<label for="nike"><span></span><b><%=category.getName() %></b></label>
							</a> 
							<%
								}
							%>
						</div>
					</div>

					<div class="tab3">
						<ul class="place">
							<li class="sort"><span>Tác giả</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="w_nav2" style="display: flex; flex-direction: column;">
							<%
								for (Author author : mapListAuthor.values()) {
							%>
							<a href="Book?search=<%=author.getName() %>&func=filter"> <input type="checkbox" id="nike" value="">
								<label for="nike"><span></span><b><%=author.getName() %></b></label>
							</a> 
							<%
								}
							%>
						</div>
					</div>

					<div class="tab4">
						<ul class="place">
							<li class="sort"><span>Nhà cung cấp</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="single-bottom">
							<%
								for (Publisher publisher : mapListPublisher.values()) {
							%>
							<a href="Book?search=<%=publisher.getName() %>&func=filter"> <input type="checkbox" id="up" value="">
								<label for="up"><span></span><b><%=publisher.getName() %></b></label>
							</a>
							<%
								}
							%>
						</div>
					</div>

					<div class="tab5">
						<ul class="place">
							<li class="sort"><span>Đánh giá</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="star-at">
							<div class="two">
								<a href="#"><i></i></a> <a href="#"><i></i></a> <a href="#"><i></i></a>
								<a href="#"><i></i></a> <a href="#"><i></i></a>
							</div>
							<div class="two">
								<a href="#"><i></i></a> <a href="#"><i></i></a> <a href="#"><i></i></a>
								<a href="#"><i></i></a>
							</div>
							<div class="two">
								<a href="#"><i></i></a> <a href="#"><i></i></a> <a href="#"><i></i></a>
							</div>
						</div>
					</div>

					<!--script-->
					<script>
						$(document).ready(function() {
							$(".tab1 .single-bottom").hide();
							$(".tab2 .single-bottom").hide();
							$(".tab3 .w_nav2").hide();
							$(".tab4 .single-bottom").hide();
							$(".tab5 .star-at").hide();
							$(".tab1 ul").click(function() {
								$(".tab1 .single-bottom").slideToggle(300);
								$(".tab2 .single-bottom").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab4 .single-bottom").hide();
								$(".tab5 .star-at").hide();
							})
							$(".tab2 ul").click(function() {
								$(".tab2 .single-bottom").slideToggle(300);
								$(".tab1 .single-bottom").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab4 .single-bottom").hide();
								$(".tab5 .star-at").hide();
							})
							$(".tab3 ul").click(function() {
								$(".tab3 .w_nav2").slideToggle(300);
								$(".tab4 .single-bottom").hide();
								$(".tab5 .star-at").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab1 .single-bottom").hide();
							})
							$(".tab4 ul").click(function() {
								$(".tab4 .single-bottom").slideToggle(300);
								$(".tab5 .star-at").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab1 .single-bottom").hide();
							})
							$(".tab5 ul").click(function() {
								$(".tab5 .star-at").slideToggle(300);
								$(".tab4 .single-bottom").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab1 .single-bottom").hide();
							})
						});
					</script>
					<!-- script -->
				</div>

				<div class="content-bottom-grid">
					<h3>BÁN CHẠY NHẤT</h3>

					<%
						for (Book bookByMax : mapListProductBuyMax.values()) {
					%>
					<div class="latest-grid">
						<div class="news">
							<a href="Book?id=<%=bookByMax.getId()%>&func=Detail"><img class="img-responsive"
								src="<%=bookByMax.getPicture() %>" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6>
								<a href="Book?id=<%=bookByMax.getId()%>&func=Detail"><%=bookByMax.getTitle() %></a>
							</h6>
							<ul>
								<li>Giá: <span><%=formatMoney(bookByMax.getSale_price())%>₫</span>
								</li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<%
						}
					%>
				</div>

				<!---->
				<div class="money">
					<h3>PHƯƠNG THỨC THANH TOÁN</h3>
					<ul class="money-in">
						<li><a href="#"><img class="img-responsive"
								src="images/p1.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p2.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p3.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p4.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p5.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p6.png" title="name" alt=""></a></li>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!---->
		<footer>
			<jsp:include page="footer/footerlevel1.jsp"></jsp:include>
		</footer>
	</div>

	<!---->
</body>
</html>