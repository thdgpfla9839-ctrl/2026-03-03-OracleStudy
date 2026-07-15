package com.sist.temp;

import com.microsoft.playwright.Browser;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.BrowserType;
import com.microsoft.playwright.ElementHandle;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.Playwright;

public class FoodData3 {

	private String html="""
			<div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                          <a href="../food/detail_before.do?no=1">
                            <img src="http://menupan.com/restaurant/restimg/002/zzmenuimg/d20034222_z.jpg" alt="">
                          </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">카페/주점-카페</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">(070) 8872-4418</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> 0</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> 0</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../food/detail_before.do?no=1">
                                <h4 class="post-headline">아름드리카페</h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                          <a href="../food/detail_before.do?no=1">
                            <img src="http://menupan.com/restaurant/restimg/002/zzmenuimg/d20034222_z.jpg" alt="">
                          </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">카페/주점-카페</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">(070) 8872-4418</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> 0</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> 0</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../food/detail_before.do?no=1">
                                <h4 class="post-headline">아름드리카페</h4>
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                          <a href="../food/detail_before.do?no=3">
                            <img src="http://menupan.com/restaurant/restimg/007/zzmenuimg/h5024574_z.jpg" alt="">
                          </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">한식</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">(063) 284-2224</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> 0</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> 0</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../food/detail_before.do?no=3">
                                <h4 class="post-headline">한국집</h4>
                            </a>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                          <a href="../food/detail_before.do?no=4">
                            <img src="http://menupan.com/restaurant/restimg/009/zzmenuimg/h4934596_z.jpg" alt="">
                          </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">한식-일반한식</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">(031) 205-4777</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> 0</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> 0</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../food/detail_before.do?no=4">
                                <h4 class="post-headline">청마루뼈다귀감자탕</h4>
                            </a>
                        </div>
                    </div>
                </div>
			"""; 
	public static void main(String[] args) {
		FoodData3 fd = new FoodData3();
		// TODO Auto-generated method stub

		// Jsoup 이나 playwright는 태그선택이 핵심 => css / Selector에서 많이 사용
		// 또한 DOM에서도 사용 => 바닐라JS를 이용해서
		
		// 이렇게 쓰는 방식이 try-with-resource => 자동으로 종료가 되면 playwright를 자동으로 닫아주는 역할 => 자동으로 예외처리 해주는 방식
		// 여기는 객체생성하는 부분
		try(Playwright playwright = Playwright.create())
		{
			// 브라우저 중 크롬브라우저 실행
			// launch :  브라우저를 띄운다 => 이 안에서 값을 가져온다
			// LaunchOptions : 옵션을 설정하는 객체
			// setHeadless => true => 브라우저를 띄우지 않고 실행 / false => 브라우저를 띄우고 실행
			Browser browser = playwright.chromium().launch(
					new BrowserType.LaunchOptions().setHeadless(true)
			);
			
			// 크롬 브라우저 실행
			BrowserContext context = browser.newContext();
			Page page = context.newPage();
			
			// HTML 문자열이나 file로 된 경우에 코딩하는 방식 => page.setContent
			// 실제 web에서 가져올 때는 page.navigate()
			page.setContent(fd.html);
			
			page.waitForSelector("div.single-post");
			
			// var : 자바10버전 부터 나옴 , 자동 지정 변수
			var items = page.querySelectorAll("div.single-post"); // querySelectorAll을 쓰면 => List items로 받는다
			for(ElementHandle item:items)
			{
				String title = getText(item, ".post-headline");
				System.out.println(title);
				
				String img = getAttr(item, ".post-thumb img","src");
				System.out.println(img);
			}
			
			browser.close();
			
			 
		}
		
	}

	public static String getText(ElementHandle el, String selector)
	{
		ElementHandle tag = el.querySelector(selector);
		return tag !=null ? tag.innerHTML().trim():"";
	}
	public static String getAttr(ElementHandle el, String selector, String attr)
	{
		ElementHandle tag = el.querySelector(selector);
		return tag !=null ? tag.getAttribute(attr):"";
	}
}
