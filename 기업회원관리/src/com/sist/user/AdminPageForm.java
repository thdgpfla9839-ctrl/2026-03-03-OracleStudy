package com.sist.user;
import java.util.List;
import java.awt.*;
import java.util.*;
import javax.swing.*;
import javax.swing.table.*;

public class AdminPageForm extends JPanel{
    JTabbedPane tp=new JTabbedPane();
    ControlPanel cp;
    MemberControlForm mcf=new MemberControlForm();
    MemberGradeForm mgf = new MemberGradeForm();
    public AdminPageForm(ControlPanel cp)
    {
    	this.cp=cp;
    	// 우리가 원하는 것은 jpanel : flowlayout -> 일렬로 배치
    	setLayout(null);
    	tp.addTab("회원관리", mcf);
    	tp.addTab("회원검색", new JPanel()); // 상속받은 걸 jpanel()에 넣어
    	tp.addTab("상품관리", new JPanel());
    	tp.addTab("구매관리", new JPanel());
    	tp.addTab("등급관리", new JPanel());
    	tp.addTab("등급관리", mgf);
    	tp.setTabPlacement(tp.LEFT);
    	tp.setBounds(10,15,920,480);
    	add(tp);
    }
}