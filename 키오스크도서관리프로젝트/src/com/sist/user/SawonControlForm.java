package com.sist.user;
import java.util.*;
import java.awt.*;
import javax.swing.*;

public class SawonControlForm extends JPanel{
  JTabbedPane tp = new JTabbedPane();
  SawonList sList=new SawonList();
  SawonFind sFind = new SawonFind();
  public SawonControlForm()
  {
	  setLayout(new BorderLayout());
	  tp.addTab("사원관리", sList);
	  tp.addTab("사원검색", sFind);
	  tp.addTab("근태관리", new JPanel());
	  tp.addTab("급여", new JPanel());
	  tp.addTab("부서관리", new JPanel());
	  tp.addTab("인사관리", new JPanel());
	  add("Center",tp); // 이제 괄호안에 패널들을 만들러 가야해, 사원메인폼에다가 추가하러 가냐지 변수선언하고

  }
  
}
