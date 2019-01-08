<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ======= #22. tiles 를 사용하는 레이아웃1 페이지 만들기  ======= --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<%
	String ctxPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html lang="kor">
<head>
	<title>AirBnB</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<!-- Link CSS -->
	<link rel="stylesheet" href="<%=ctxPath %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/main.css">
	<!-- Link JS -->  
	<script type="text/javascript" src="<%=ctxPath %>/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/resources/js/bootstrap.min.js"></script>	
	<script type="text/javascript">
		$(document).ready(function(){


		});

	</script>
</head>
<body>
	<header>
		<div class="navigation">
			<div class="col-md-6">
				<img src="<%=ctxPath %>/resources/images/main/logo.png" style="width:20%;">
			</div>
			<div class="col-md-6">
				<ul id="util_menu">
					<li>도움말</li>
					<li>회원가입</li>
					<li>로그인</li>
				</ul>
			</div>	
		</div>
		<section id="slider"><!--slider-->
	         <div class="row">
	            <div class="col-md-12">
	               <div id="slider-carousel" class="carousel slide" data-ride="carousel">
	                  <ol class="carousel-indicators">
	                     <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
	                     <li data-target="#slider-carousel" data-slide-to="1"></li>
	                     <li data-target="#slider-carousel" data-slide-to="2"></li>
	                  </ol>
	                  <div class="carousel-inner">
	                     <div class="item active">
	                         <img src="<%=ctxPath %>/resources/images/main/testImg1.jpg" alt="" />
	                     </div>
	                     <div class="item">
	                         <img src="<%=ctxPath %>/resources/images/main/testImg2.jpg"alt="" />
	                     </div>
	                     <div class="item">
	                         <img src="<%=ctxPath %>/resources/images/main/testImg3.jpg" alt="" />
	                     </div>
	                  </div>
	                  <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
	                     <i class="fa fa-angle-left"></i>
	                  </a>
	                  <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
	                     <i class="fa fa-angle-right"></i>
	                  </a>
	               </div> 
	               <div class="choose_A">
			         	<div class="col-md-2 domestic">국내</div>
			         	<div class="col-md-2 oversea">도시</div>
			         	<div class="col-md-3 check_in">체크인</div>
			         	<div class="col-md-3 check_out">체크아웃</div>
			         	<div class="col-md-2 search">검색</div>
	         		</div>
	            </div> 
	         </div> 
	   </section><!--/slider-->
	   <span class="bg_up"></span>
	</header>

	<section id="recommend_lodging">
		<div class="container">
			<div id="section_title" align="center">
				<h3>추천 숙소</h3>
			</div>		
			<div class="row not-rowStyle">
				<ul id="rooms_show_ul">
				<!-- 데이터 불러올 시 이 형식에 맞게 append 시킬것-->
				<li>     
					<img class="img_room" src="https://image.xiaozhustatic1.com/00,400,326,2/10,0,68,18115,1800,1200,e6ea498c.jpg" width="380" height="326" /> 
   				 	<div class="rooms_intro">
	        			<img class="img_user_fd" src="https://image.xiaozhustatic1.com/22/10,0,43,6234,375,376,50965e20.jpg" />
				        <span class="room_name">武汉民宿_安居的家 - 武汉</span>
				        <span class="index_price"><em class="bigFont">&#165;</em>258</span>
		    		</div> 
				</li>                                 
				<li>     
					<img class="img_room" src="https://image.xiaozhustatic1.com/00,400,326,2/10,0,68,18115,1800,1200,e6ea498c.jpg" width="380" height="326"/> 
   				 	<div class="rooms_intro">
	        			<img class="img_user_fd" src="https://image.xiaozhustatic1.com/22/10,0,43,6234,375,376,50965e20.jpg" />
				        <span class="room_name">武汉民宿_安居的家 - 武汉</span>
				        <span class="index_price"><em class="bigFont">&#165;</em>258</span>
		    		</div> 
				</li>        
				<li>     
					<img class="img_room" src="https://image.xiaozhustatic1.com/00,400,326,2/10,0,68,18115,1800,1200,e6ea498c.jpg" width="380" height="326"  /> 
   				 	<div class="rooms_intro">
	        			<img class="img_user_fd" src="https://image.xiaozhustatic1.com/22/10,0,43,6234,375,376,50965e20.jpg" />
				        <span class="room_name">武汉民宿_安居的家 - 武汉</span>
				        <span class="index_price"><em class="bigFont">&#165;</em>258</span>
		    		</div> 
				</li>        
				<li>     
					<img class="img_room" src="https://image.xiaozhustatic1.com/00,400,326,2/10,0,68,18115,1800,1200,e6ea498c.jpg" width="770" height="326" /> 
   				 	<div class="rooms_intro city_big">
	        			<img class="img_user_fd" src="https://image.xiaozhustatic1.com/22/10,0,43,6234,375,376,50965e20.jpg" />
	        			<br/>
				        <span class="room_name">武汉民宿_安居的家 - 武汉</span>
				        <br/>
				        <span class="index_price"><em class="bigFont">&#165;</em>258</span>
		    		</div> 
				</li>        
				<li>     
					<img class="img_room" src="https://image.xiaozhustatic1.com/00,400,326,2/10,0,68,18115,1800,1200,e6ea498c.jpg" width="380" height="326"  /> 
   				 	<div class="rooms_intro">
	        			<img class="img_user_fd" src="https://image.xiaozhustatic1.com/22/10,0,43,6234,375,376,50965e20.jpg" />
				        <span class="room_name">武汉民宿_安居的家 - 武汉</span>
				        <span class="index_price"><em class="bigFont">&#165;</em>258</span>
		    		</div> 
				</li>        
				<li>     
					<img class="img_room" src="https://image.xiaozhustatic1.com/00,400,326,2/10,0,68,18115,1800,1200,e6ea498c.jpg" width="380" height="326" /> 
   				 	<div class="rooms_intro">
	        			<img class="img_user_fd" src="https://image.xiaozhustatic1.com/22/10,0,43,6234,375,376,50965e20.jpg" />
				        <span class="room_name">武汉民宿_安居的家 - 武汉</span>
				        <span class="index_price"><em class="bigFont">&#165;</em>258</span>
		    		</div> 
				</li>                                 
				<li>     
					<img class="img_room" src="https://image.xiaozhustatic1.com/00,400,326,2/10,0,68,18115,1800,1200,e6ea498c.jpg" width="770" height="326"/> 
   				 	<div class="rooms_intro city_big">
	        			<img class="img_user_fd" src="https://image.xiaozhustatic1.com/22/10,0,43,6234,375,376,50965e20.jpg" />
	        			<br/>
				        <span class="room_name">武汉民宿_安居的家 - 武汉</span>
				        <br/>
				        <span class="index_price"><em class="bigFont">&#165;</em>258</span>
		    		</div> 
				</li>        
				
				<!-- //여기까지-->   
				</ul>
			</div>
		</div>
	</section>
	<section id="company_A">
		<div class="container">
			<div id="section_title" align="center">
				<h3>에어비앤비와 함께하는 여행</h3>
			</div>		
			<div class="col-md-12 info_company">
				<div class="col-md-4 info_1">
					<svg style="height:40px;width:40px;display:block;overflow:visible" viewBox="0 0 32 32" fill="#60B6B5" fill-opacity="0" stroke="#60B6B5" stroke-width="1.5" focusable="false" aria-hidden="true" role="presentation" stroke-linecap="round" stroke-linejoin="round"><path d="m23.99 2.75c-.3 0-.6.02-.9.05-1.14.13-2.29.51-3.41 1.14-1.23.68-2.41 1.62-3.69 2.94-1.28-1.32-2.46-2.25-3.69-2.94-1.12-.62-2.27-1-3.41-1.14a7.96 7.96 0 0 0 -.9-.05c-1.88 0-7.26 1.54-7.26 8.38 0 7.86 12.24 16.33 14.69 17.95a1 1 0 0 0 1.11 0c2.45-1.62 14.69-10.09 14.69-17.95 0-6.84-5.37-8.38-7.26-8.38"></path></svg>
					<p class="bold">24시간 연중무휴 지원</p>
					<p>
					하루 24시간 언제나 여러분을 도와드립니다. 전세계 어디에서나 언제든
					에어비앤비 지원팀에 연락주세요.
					</p>
				</div>
				<div class="col-md-4 info_2">
					<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height:40px;width:40px;display:block;fill:#60B6B5"><path d="m23.57 11.4-1.75-1.76-3.85-3.87-1.78-1.79-2.7-2.71-.82-.83-.22-.23-.06-.06c-.22-.22-.53-.22-.73-.02l-1.75 1.76-3.85 3.87-3.85 3.87-1.75 1.76a1.49 1.49 0 0 0 -.44 1.05v.01c0 .38.15.77.44 1.06l.55.55a1.49 1.49 0 0 0 2.01.08v8.4c0 .81.68 1.45 1.5 1.45h15c .82 0 1.5-.65 1.5-1.45v-8.4c.59.49 1.45.47 2.01-.08l.55-.55c.29-.29.44-.68.44-1.06v-.01c0-.38-.14-.77-.44-1.06zm-3.57 11.16c0 .24-.22.45-.5.45h-15c-.28 0-.5-.21-.5-.45v-9.36l8-7.99 8 7.99zm2.85-9.74-.55.55c-.2.2-.52.2-.71.01l-9.24-9.22a.5.5 0 0 0 -.71 0l-9.24 9.22a.5.5 0 0 1 -.71-.01l-.55-.55a.5.5 0 0 1 -.01-.71l1.75-1.76 3.85-3.87 3.85-3.87 1.4-1.4.77.77 2.7 2.71 1.78 1.79 3.85 3.87 1.75 1.76a.51.51 0 0 1 -.01.71z" fill-rule="evenodd"></path></svg>
					<p class="bold">글로벌 호스팅 기준</p>
					<p>
					게스트는 숙박 후 매번 호스트에 대한 후기를 작성합니다. 에어비앤비의 모든 호스트는 일정 수준 이상의 별점을 받고 호스팅 기준을 준수해야 합니다.</p>
				</div>
				<div class="col-md-4 info_3">
					<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height:40px;width:40px;display:block;fill:#60B6B5"><path d="m15.37 13.54-.01.01a.53.53 0 0 0 .01-.01m-.37 9.46h-11.5c-.28 0-.9-.22-1.38-.58-.71-.52-1.12-1.31-1.12-2.42 0-.04 0-.07.01-.11.09-1.1 1.59-2.44 4.02-3.79a33.14 33.14 0 0 1 2.9-1.42 35.57 35.57 0 0 1 1.31-.54c.63-.26.71-.95.18-1.35a4.55 4.55 0 0 1 -.38-.31 7.1 7.1 0 0 1 -.84-.9c-.73-.92-1.17-1.96-1.2-3.09v-2.99c.07-2.36 2.38-4.5 5.04-4.5 2.67 0 4.96 2.14 4.96 4.5v3c0 1.13-.43 2.17-1.15 3.11a7.35 7.35 0 0 1 -1.09 1.13l-.08.07c-.02.02-.02.02-.05.05s-.03.03-.09.14c-.05.47-.05.47.46.7a.49.49 0 0 0 .36-.15l.06-.05a8.32 8.32 0 0 0 1.23-1.28c.84-1.1 1.35-2.35 1.35-3.72v-3c0-2.92-2.75-5.5-5.96-5.5-3.2 0-5.96 2.56-6.04 5.49v3.01c.03 1.38.56 2.62 1.42 3.71.31.39.63.73.96 1.03.06.05.1.08.15.12a34.28 34.28 0 0 0 -3.98 1.87c-2.73 1.51-4.41 3.02-4.54 4.58a2.41 2.41 0 0 0 -.01.19c0 2.55 1.91 3.99 3.5 4h11.5a.5.5 0 1 0 0-1m7.67-4.22c-.36.74-.97 1.55-1.78 2.38a20.33 20.33 0 0 1 -1.89 1.71 19.94 19.94 0 0 1 -1.89-1.71c-.81-.83-1.42-1.64-1.78-2.38-.22-.45-.33-.86-.33-1.23 0-.99.61-1.56 1.43-1.56.7 0 1.55.53 2.18 1.31a.5.5 0 0 0 .78 0c .63-.78 1.48-1.31 2.18-1.31.82 0 1.43.57 1.43 1.56 0 .36-.11.77-.33 1.23m-1.1-3.78c-.89 0-1.82.5-2.57 1.25-.75-.76-1.68-1.25-2.57-1.25-1.36 0-2.43 1.01-2.43 2.56 0 .53.15 1.08.43 1.66.41.85 1.09 1.74 1.96 2.64a21.09 21.09 0 0 0 2.31 2.05.5.5 0 0 0 .6 0 20.91 20.91 0 0 0 2.31-2.05c.87-.9 1.55-1.79 1.96-2.64.28-.58.43-1.13.43-1.66 0-1.55-1.07-2.56-2.43-2.56" fill-rule="evenodd"></path></svg>
					<p class="bold">별점 5점 호스트</p>
					<p>
					깔끔하게 정돈된 침대 시트에서부터 브런치 맛집 정보까지, 에어비앤비 호스트는 현지인의 강점을 살린 서비스를 풍성하게 제공합니다.</p>
				</div>
			</div>
		</div>
	</section>
	<section id="best_reviewes">
		<div class="container">
			<div class="index_commnet">
       			<div class="index_T">
	            	<h1 class="white">世间所有的相遇都是久别重逢</h1>
	            	<span class="white">房客和房东都在彼此感动着</span>
        		</div>
        		<div id="commentdiary">
    			<div class="comment_column">
				<div class="cmt_con">
  					<span class="comment_user">房客点评</span>
   		   			<div style="display: none;">
    				<span>
    					<img src="https://image.xiaozhustatic2.com/22/51,0,77,15206,132,132,0b8c541f.jpg">
    				</span>
		            <span>YOYOac</span>
		            <span>2018.12</span>
		            <span class="comment_W">
		            	<a href="http://dali.xiaozhu.com/fangzi/49636167903.html#comment" target="_blank">是我喜欢的感觉，院子里的草坪、老木板做的路径、老窗花做的茶台、满院的竹子，就连多肉都能养的很有意境。卫生自不用多说了，房间的花儿都是鲜花，清雅舒适。没事在院子里晒晒太阳喝喝茶，无比惬意。老板还给我升级了房间，房间里视野很好，还可以看海景。茶室里有很多精致的小物件，我忍不住喜欢买了几款，价格还不贵。这里的一切都是那么和谐、自然，要不是假期太短，真想好好感受这里的慢生活，以后还会再来。</a>
		            </span>
        		</div>
                <div style="display: none;">
            		<span>
            			<img src="https://image.xiaozhustatic1.com/22/6,0,31,4546,320,321,809b8333.jpg">
            		</span>
		            <span>Pennyluo</span>
		            <span>2018.12</span>
		            <span class="comment_W">
		            	<a href="http://lijiang.xiaozhu.com/fangzi/32327628201.html#comment" target="_blank">性价比超高的客栈，阳光、大落地窗、吊椅等等，屋里屋外都是木质结构，很有味道。海哥和玉姐都是很亲和幽默的人，可以打麻将、煮茶喝酒，还可以和其他住客一起在院子里吃饭，很舒服。关键是老板娘厨艺很赞呢，比外面好多饭馆做的都好吃！至于海哥的茶艺嘛，还有待提升，哈哈哈哈！老板老板娘都是当地人，如果你要去哪里玩，不懂的都可以问他们，他们很热情很善良，会告诉你性价比最高的攻略。总之，住了一周，很开心，谢谢招待！
		            	</a>
		            </span>
		        	</div>
                <div style="display: block;">
            <span><img src="https://thirdwx.qlogo.cn/mmopen/vi_32/kDiaoDicA19FPDOFGh9YNLgt0iaUibYxb1c4nc8IZkTtKJmialy5micsVxBZT3CvAicz9V5rOlmibur8qrjAFH1IExOlsw/132"></span>
            <span>好命的马马</span>
            <span>2018.12</span>
            <span class="comment_W"><a href="http://cq.xiaozhu.com/fangzi/39896868603.html#comment" target="_blank">很幸运，生日跟闺蜜们一起聚聚，比照片更温馨，细节布置很到位。厅很大，容纳二十人左右都没有问题，餐具酒杯开瓶器一应俱全。老板很周到，因为生日还特意送了四种口味的果酒。店里有各种饮料和酒水，小吃，价格跟便利店一个价，前台还有八张公交卡供客人免费使用，这一点对外地的客人来说真的很贴心。打碎了一个红酒杯，本来要给老板赔偿的，但是老板说又不是故意的，不用赔，非常耿直的老板了，祝愿生意兴隆！</a></span>
        </div>
                <div style="display: none;">
            <span><img src="https://tfs.alipayobjects.com/images/partner/T1blNeXhxXXXXXXXXX"></span>
            <span>CLomg</span>
            <span>2018.12</span>
            <span class="comment_W"><a href="http://km.xiaozhu.com/fangzi/33668836503.html#comment" target="_blank">第一次来昆明，为了方便就选了离女朋友学校近的民宿。一下飞机就感觉喜欢上了这座城市，蓝天，白云，阳光，微风，从冬天跨越到了春天。房东很耐心细致的说了入住的事宜，房间也很满意，特别喜欢投影仪。异地恋最心酸的可能就是跨越千里，刚刚见面又得分离。每一次分别都是为了下一次更好的相聚，希望所有异地恋的情侣都可以好好坚持下去，早点结束异地，好好的在一起。谢谢这间温暖的小屋，谢谢在冬天也依然温暖的昆明，下次再见。</a></span>
        </div>
        <div style="display: none;">
            <span>
            	<img src="https://image.xiaozhustatic3.com/22/17,0,3,2334,329,329,f2ca8d0b.jpg">
            </span>
            <span>阿紫azier</span>
            <span>2018.12</span>
            <span class="comment_W">
            	<a href="http://zhangjiajie.xiaozhu.com/fangzi/25340701203.html#comment" target="_blank">原先的房间出了点bug，老板为我们更换了房间，还特地把我们想要的麻将桌搬过来了。到了张家界后老板亲自来接机，一路上跟我们讲风土人情，还根据我们的需求为我们量身定做了行程！管家安排了导游每天来接我们，还带我们去吃本地特色的三下锅。在看魅力湘西时碰到了民宿老板，还特地买了糖给我们吃，很暖心。最后还为我们安排了休息室，送我们到机场。虽然整个行程中张家界的天气不美好，但是山遇城的服务带来了很多温暖。
            	</a>
            </span>
        </div>
        <ul class="cmt_ul">
            <li class="cmt_current"></li>
            <li class=""></li>
            <li class=""></li>
            <li class=""></li>
            <li class=""></li>
        </ul>
    </div> 
    <em class="middle_line"></em>              
	</div>
	<div class="comment_column">
    <div class="cmt_con cmt_R">
        <span class="comment_user">房东日记</span>
        <div>
	        <span><img src="https://image.xiaozhustatic1.com/22/14,0,18,23531,260,260,042cc067.jpg"></span>
	        <span>YQYJ_HOTEL</span>
	        <span>2018.10.05</span>
	        <span class="comment_W"><a href="http://www.xiaozhu.com/fangdong/32513670501/diary/42816166500.html#" target="_blank">有位很有礼貌的房客提出了一个小小的要求，因为和女朋友一起来，问能不能给布置下房间。国庆来临之际，我计划着为周先生布置房间，因为没有亲手为客人布置过，有点迷茫。但是一心想给他们一个惊喜，整体以紫色的气球花瓣为装饰，一对相亲相爱的布娃娃代表男女主人，一对美丽的白天鹅代表着纯洁的爱情，阳台围满的粉色气球，代表甜甜蜜蜜。接到房客的时候，女主角推开门大大的一个惊喜！满意！同时我的心也乐开了花。
			</a></span>
        </div>
        <div style="display:none;">					
            <span>
            	<img src="https://image.xiaozhustatic2.com/22/51,0,34,21989,364,363,f8eeb5e6.jpg">
            </span>
            <span>木兮君</span>
            <span>2018.10.23</span>
            <span class="comment_W">
            	<a href="http://www.xiaozhu.com/fangdong/8192262615/diary/43831272500.html#" target="_blank">房子和孩子对我而言都是一样重要的存在。对颜色的搭配、细节的把控、品质的追求，以及装修的整体效果，我都很苛刻。做民宿这2年有了很多的改变，每一次真诚的反馈，对我而言都是一份收获，这代表着我付出的努力得到了认可，得到了肯定。每一次的好评，都是客人在入住过后的真实体验，她们觉得它是旅途中的心灵驿站，于我又何尝不是呢，每一次的离开，都像告别老朋友一样……
			</a></span>
        </div>
        <div style="display:none;">
            <span>
            	<img src="https://image.xiaozhustatic1.com/22/5,0,92,1440,448,448,d5b36d39.jpg">
            </span>
            <span>上品佳房</span>
            <span>2018.12.19</span>
            <span class="comment_W">
            	<a href="http://www.xiaozhu.com/fangdong/707380938/diary/91724259300.html#" target="_blank">初遇小猪，应该是在某篇推广的文章中看到它，从而发现了新的旅行住宿形式。有出租船屋的，有出租沙发的，还有整套出租的，感觉开拓了新的眼界。今年年初，我自己盘下几间房来做民宿。准备的过程虽然很苦，但也快乐着，终于，一切都布置好了。对于我来说，一间民宿，就是一个小世界，它不仅仅是一个房间，也是我的一种希望，希望租客朋友们在这里一起拉进与这座城市的距离，一起分享故事，享受宁静，热情，亲切与关怀。
            	</a>
            </span>
        </div>
        <div style="display:none;">
            <span>
            	<img src="https://image.xiaozhustatic3.com/22/11,0,7,6971,280,281,4352127e.jpg">
            </span>
            <span>茉莉与花</span>
            <span>2018.11.11</span>
            <span class="comment_W">
            	<a href="http://www.xiaozhu.com/fangdong/19274383601/diary/45818605100.html#" target="_blank">生活一片兵荒马乱，总有疲惫不堪的日子。好在我们不会将自己淹死在生活的洪流之中，总会试图寻找一些方法来让那颗疲惫的心得到片刻的治愈。有的人会选择来一场旅行，从忙碌的生活中抽离出来，去一个陌生的城市，去看那些未知的风景，尽情的撒欢释放压力。而茉莉家，希望是你旅途中的一个选择。我们希望你在这漠然的空间里，慢下来，做你最真实的自己，卸下防备，卸下伪装，不焦虑不怯懦，尽情的享受生活。
            	</a>
            </span>
        </div>
        <div style="display:none;">
            <span>
            	<img src="https://image.xiaozhustatic2.com/22/14,0,99,8951,260,260,9eaf4a8b.jpg">
            </span>
            <span>那家_那海</span>
            <span>2018.11.28</span>
            <span class="comment_W">
            	<a href="http://www.xiaozhu.com/fangdong/28121909501/diary/71285030800.html#" target="_blank">民宿不是一门生意，而是一种情怀。做民宿是我做得最用心，最开心的一件事情了。上天没有辜负我的一片心意，目前我遇到的都是很和善很友爱的客人，他们用自己的方式感动着我。山西的客人，千里迢迢背来一袋小米和一箱子山西脆饼；东北的客人，在遭遇雪天航班不能及时起飞的情况下，没有半点情绪和怨言，还拍雪景给我看，给我带了东北大米、玉米糁和糙米。承蒙大家的关爱，让我更有动力前进，遇到困难也只是会心一笑，然后继续努力。</a>
            </span>
        </div>
        <ul class="cmt_ul">
            <li class="cmt_current"></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>    
		</div>
		</div>
    </div>

		</div>

	</section>

	<footer>
		<div class="container">
			<div class=" col-md-12 footer_menues">	
					<ul class="col-md-3">
						<li>에어비앤비</li>
						<li>채용정보</li>
						<li>미디어</li>
						<li>정책</li>
						<li>도움말</li>
						<li>다양성과 소속감</li>
					</ul>
					<ul class="col-md-3">
						<li>여행하기</li>
						<li>신뢰와 안전</li>
						<li>친구 초대하기</li>
						<li>Airbnb Citizen</li>
						<li>비즈니스 프로그램</li>
						<li>가이드북</li>
						<li>Airbnbmag</li>
						<li>에어비앤비 이벤트NEW!</li>
						<li>한국의 변경된 환불 정책</li>
					</ul>
					<ul class="col-md-3">
						<li>호스팅하기</li>
						<li>호스팅의 장점</li>
						<li>호스트 추천하기</li>
						<li>호스팅 기준</li>
						<li>책임감 있는 호스트 되기</li>
						<li>커뮤니티 센터</li>
						<li>트립 호스팅NEW!</li>
						<li>Open Homes 프로그램NEW!</li>
					</ul>
					<ul class="col-md-3">
						<li>이용약관</li>
						<li>개인정보 처리방침</li>
						<li>여행지 찾기</li>
					</ul>
			</div>
			<div class="_qtix31">
				<div class="_ni9axhe">
					<div style="margin-right:8px">
						<svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height:1.5em;width:1.5em;display:block;fill:#767676">
							<path d="m499.3 736.7c-51-64-81-120.1-91-168.1-10-39-6-70 11-93 18-27 45-40 80-40s62 13 80 40c17 23 21 54 11 93-11 49-41 105-91 168.1zm362.2 43c-7 47-39 86-83 105-85 37-169.1-22-241.1-102 119.1-149.1 141.1-265.1 90-340.2-30-43-73-64-128.1-64-111 0-172.1 94-148.1 203.1 14 59 51 126.1 110 201.1-37 41-72 70-103 88-24 13-47 21-69 23-101 15-180.1-83-144.1-184.1 5-13 15-37 32-74l1-2c55-120.1 122.1-256.1 199.1-407.2l2-5 22-42c17-31 24-45 51-62 13-8 29-12 47-12 36 0 64 21 76 38 6 9 13 21 22 36l21 41 3 6c77 151.1 144.1 287.1 199.1 407.2l1 1 20 46 12 29c9.2 23.1 11.2 46.1 8.2 70.1zm46-90.1c-7-22-19-48-34-79v-1c-71-151.1-137.1-287.1-200.1-409.2l-4-6c-45-92-77-147.1-170.1-147.1-92 0-131.1 64-171.1 147.1l-3 6c-63 122.1-129.1 258.1-200.1 409.2v2l-21 46c-8 19-12 29-13 32-51 140.1 54 263.1 181.1 263.1 1 0 5 0 10-1h14c66-8 134.1-50 203.1-125.1 69 75 137.1 117.1 203.1 125.1h14c5 1 9 1 10 1 127.1.1 232.1-123 181.1-263.1z">
							</path>
						</svg>
					</div>
				</div>
				<div class="_ni9axhe">
					<div dir="ltr" class="_nwmqo60">© Airbnb, Inc.</div>
				</div>
			</div>
		</div> 
	</footer> 
</body>
</html>