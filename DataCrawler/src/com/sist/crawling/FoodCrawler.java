package com.sist.crawling;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.DataDAO;
import com.sist.vo.FoodVO;

// jsoup으로 크롤링

/*
 * 메뉴판 닷컴 참조
 * https://www.menupan.com/restaurant/bestrest/bestrest.asp?pt=rt 실시간
 * https://www.menupan.com/restaurant/bestrest/bestrest.asp?pt=wk 주간
 * https://www.menupan.com/restaurant/bestrest/bestrest.asp?pt=nw 신규
 * https://www.menupan.com/restaurant/bestrest/bestrest.asp?trec=8628&pt=rt&page=2
 * 
 */

/*
 *  <p class="listName">
 *  <span class="restName">
 *  <a href="/restaurant/onepage.asp?acode=D200342" target="_blank">아름드리카페</a></span></p>
 */

/*
 *  <div class="areaBasic">
		<dl class="restName">
			<dt>업체명<span style="color:#ffffff;cursor:default;" ondblclick="$('#id_basicdata_reporter').toggle();">.</span></dt>
			<dd class="name">아름드리카페&nbsp;&nbsp;<span id="id_basicdata_reporter" style="display:none">[D200342 : 제휴영업팀]</span></dd>
		</dl>
		<dl class="restType">
			<dt>업종</dt>
			<dd class="type">카페/주점-카페</dd>
		</dl>

		<dl class="restTel">
			<dt>전화번호</dt>
			<dd class="tel1">(070) 8872-4418</dd>

		</dl>
		<dl class="restAdd">
			<dt>주소</dt>
			<dd class="add1"><a href="/map/restmap/map_search.asp?acode=D200342" target="_blank">강원 동해시 평릉동 487-1</a></dd>

			<dd class="add2">[새주소] <a href="/map/restmap/map_search.asp?acode=D200342" target="_blank">강원 동해시 평원5길 4</a></dd>

		</dl>

		<dl class="restGrade">
			<dt>평점</dt>
			<dd class="rate">
				<p class="point"><span class="star" style="width:0%"></span><!-- ☆☆☆☆☆ //--></p>
				<p class="score"><span class="total">0.0</span><span class="line">|</span><span class="count">0명 참여</span></p>
			</dd>
			<dd class="btnPoint">

				<a href="javascript:;" onClick="fn_Openmember();"><img src="/image/restaurant/onepage/btn_point.gif" alt="평가하기" /></a>

			</dd>
		</dl>

		<dl class="restTheme">
			<dt>테마</dt>
			<dd class="Theme">
 */
public class FoodCrawler {

	private static String BASE_URL = "https://www.menupan.com/restaurant/bestrest/bestrest.asp?pt=rt";
	private static String[] category = { "rt", "wk", "nw"

	};

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		DataDAO dao = DataDAO.newInstance();
		try
		{
			/* for(int i=0;i<category.length;i++) */
			{
				/* System.out.println("번호:"+(i+1)); */
				
				 for(int p=1;p<=346;p++) // 페이지 가져오기
				 {
				
				// 웹 크롤링
				Document doc = Jsoup.connect(BASE_URL+"&page="+p).get(); 
				System.out.println("================"+p+"page============================");
				
				// 여러개의 태그를 불러올 때는 Elements
				Elements link = doc.select("p.listName span.restName a");
				
				for(int j=0;j<link.size();j++)
				{
					try
					{
					  System.out.println(link.get(j).attr("href"));
					  String url="https://www.menupan.com"+link.get(j).attr("href");
					  Document doc2 = Jsoup.connect(url).get(); // 링크 읽어와서 이동
					
				    	 // 태그 한개 읽어오려고 하는 중 
					    // 불필요한 글자 자르기 위해 trim()
					   // 업체명
					  String name = doc2.selectFirst("div.areaBasic dl.restName dd.name").ownText().trim();
					  System.out.println(name);
					
					
					  // 업종
					  Element type =doc2.selectFirst("div.areaBasic dl.restType dd.type");
					  System.out.println(type.text());
					
					  // 전화번호 
					  Element phone = doc2.selectFirst("div.areaBasic dl.restTel dd.tel1");
					  System.out.println(phone.text());

					  // 주소
					  Element address = doc2.selectFirst("div.areaBasic dl.restAdd dd.add1");
					  System.out.println(address.text());
					
					  // 테마
					   String strTheme="";
					  try
					  {
						Element theme = doc2.selectFirst("div.areaBasic dl.restTheme dd.Theme");
						System.out.println(theme.text());
						strTheme = theme.text();

					  }
					   catch (Exception ex)
					   {
						strTheme ="없음";
					   }
					
					  // 평점
					 Element score = doc2.selectFirst("div.areaBasic dl.restGrade span.total");
					 System.out.println(score.text());
					
					 // 가격대
					 Element price = doc2.selectFirst("div.restPrice p.price");
					 System.out.println(price.text());
					 
					 // 영업시간
					 Element time =doc2.selectFirst("div.tabInfo ul.tableTopA dd.txt2");
					 System.out.println(time.text());
					 
					 // 소개
					 Element content = doc2.selectFirst("div.tabInfo ul.tableBottom div#info_ps_f");
					 System.out.println(content.text());
					 
					 // 예약정보
					 Element reserve = doc2.select("div.tabInfo ul.tableLR dd").get(3);
					 System.out.println(reserve.text());
					 
					 // 주차 => 주차 부분이 오류가 나서 다른 정보가 불러오는 곳이 있음
					 Elements tableLR = doc2.select("div.tabInfo ul.tableLR dt");
					 Element parking = null;
					 for(int k=0;k<tableLR.size();k++)
					 {
						 String s = tableLR.get(k).text(); // tableLr 아래 dt값들
						 if(s.equals("주차"))
						 {
							 parking = doc2.select("div.tabInfo ul.tableLR dd").get(k);
						 }
						 
					 }
					 System.out.println(parking.text());
					 
					  // 큰사이즈 이미지
					 Element poster = doc2.selectFirst("div.areaThumbnail img#rest_bigimg");
					 System.out.println(poster.attr("src"));
					 
					  // 큰이미지 밑에 자잘한 이미지들
					 // 코드뒤에 0번 1번 이렇게 붙어잇어서 한번에 못가져옴 => <img id="restphoto_img_0 이렇게 돼 있어서 구분자로 쓸 수 없다
					 Elements image = doc2.select("div#id_restphoto_slides img[src*=/restimg/]"); 
					 String images = "";
					 for(int k=0;k<image.size();k++)
					 {
						 images+=image.get(k).attr("src")+",";
					 }
					 images=images.substring(0,images.lastIndexOf(",")); // 맨 마지막 , 제거를 위해
					 System.out.println(images);
					 // 크롤링 끝
					 
					 // 데이터 넣기 => 여기는 순서 안 지켜도 됨
					 FoodVO vo = new FoodVO();
					 vo.setCno(1);
					 vo.setName(name);
					 vo.setType(type.text());
					 vo.setPhone(phone.text());
					 vo.setAddress(address.text());
					 vo.setTime(time.text());
					 vo.setTheme(strTheme);
					 vo.setPrice(price.text());
					 vo.setScore(Double.parseDouble(score.text().trim()));
					 vo.setParking(parking.text());
					 vo.setReserve(reserve.text());
					 vo.setContent(content.text());
					 vo.setPoster(poster.attr("src"));
					 vo.setImages(images);
					 
					 dao.foodInsert(vo);
					 
					 
				}catch (Exception ex) {
					ex.printStackTrace();
					}
				} // for문 끝
				
			} // 페이지 for문 끝
			} // 큰 for문 끝
			System.out.println("저장 완료");
		}
		catch (Exception ex) { ex.printStackTrace();} // 이거 꼭 써서 어디서 에러난지 확인하자
	}

}
