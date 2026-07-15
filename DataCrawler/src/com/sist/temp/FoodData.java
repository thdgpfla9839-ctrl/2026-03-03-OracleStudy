package com.sist.temp;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class FoodData {

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
			""";
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 낱개로 데이터 출력하는 방법
		FoodData fd = new FoodData();
	    System.out.println(fd.html);
	    
	    // JSoup 연습 => html 파서기
	    try
	    {
	    	Document doc = Jsoup.parse(fd.html,"UTF-8"); // 한글이 깨지면 유니코드 붙여준다
			/* System.out.println(doc); */
	    	
	    	// 이미지까지 가져오는 방법
	    	// 데이터 한개 가져오는 중 => Element => 이미지 태그 가져오려고 하는 중
	    	Element img = doc.selectFirst("div.post-thumb img"); // div 안에 이미지 태그를 가져와라 클래스라서 .을 붙임
	    	String src = img.attr("src"); // 속성값을 가져온다 => attr
	    	System.out.println(src);
	    	
	    	// type 
	    	Element type = doc.selectFirst("div.post-author"); // a태그에 구분자가 없어서 그 위에 괄호를 구분자로 생각하고 불러옴
	    	String val1 = type.text();
	    	System.out.println(val1);
	    	
	    	// 전화번호
	    	Element phone = doc.selectFirst("div.post-date"); // 가장 위에 있는 걸 구분자로 대신 사용할 때 selectFirst
	    	String val2;
	    	val2 = phone.text();
	    	System.out.println(val2);
	    	
	    	// 포스터
	    	Element poster = doc.selectFirst("div.post-headline");
	    	String val3;
	    	val3= poster.text();
	    	System.out.println(val3);
	    	
	    	// 구분자가 바로 위에 없는 경우
	    	Element data = doc.select("div.post-author-date-area a").get(1);// 해당 부분을 구분자로 하면 밑에 데이터가 두개 이상일 경우에는 인덱스 번호를 줘서 get()으로 불러온다
	    	System.out.println(data.text());
	    }
	    catch (Exception ex) 
	    {
	    	ex.printStackTrace();
	    }
	}

}
