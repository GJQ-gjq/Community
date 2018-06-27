<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="header">
					<span><img src="${pageContext.request.contextPath}/static/images/logo.jpg"></span>
					<ul>
						<li><span
							style="color:#5D5D5D ;font-size:20px ;padding-right:10px ;">欢迎[</span>
						</li>
						<li class="dropdown">
							<button type="button" class="btn dropdown-toggle"
								id="dropdownMenu1" data-toggle="dropdown"
								style="color:#F70B19 ;background-color:#fff;outline:none;">
								${user1.userName} <b class="caret"></b>
							</button>
							<span style="float: right;color:#5D5D5D ;font-size:20px ;">]</span>
							<ul class="dropdown-menu" data-role="menu" aria-labelledby="dropdownMenu1">
								<%--<li style="clear: both;padding-left: 10px ;"><a href="#">个人信息</a>
								</li>
								<li style="clear: both;width: 100%;" class="divider"></li>
								<li style="clear: both;padding-left: 10px ;"><a href="#">修改密码</a>
								</li>
								<li style="clear: both;width: 100%;" class="divider"></li>
								--%><li style="clear: both;padding-left: 10px ;"><a
									href="/community/loginOut">退出</a>
								</li>
							</ul></li>
					</ul>
				</div>