<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="row clearfix">
	<div class="Carousel">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			date-interval="1000">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/static/images/1.png"
						alt="First slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/static/images/2.png"
						alt="Second slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/static/images/3.png"
						alt="Third slide">
				</div>
			</div>
		</div>
	</div>
</div>
