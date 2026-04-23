package com.sist.client;
import java.util.*;
import java.awt.*;
import javax.swing.*;
public class ControllerPenal extends JPanel{
	CardLayout card=new CardLayout();
	UserMainForm mf;
	BoardList bList;
	BoardInsert bInsert;
	BoardDetail bDetail;
	HomePanel hp=new HomePanel();
    public ControllerPenal(UserMainForm mf)
    {
    	this.mf=mf;
    	bList=new BoardList(mf);
    	this.bInsert = bInsert;
    	bInsert = new BoardInsert(mf);
    	this.bDetail = bDetail;
    	bDetail = new BoardDetail(mf);
    	
    	setLayout(card);
    	//setBackground(Color.CYAN);
    	add("HOME",hp);
    	add("BLIST",bList);
    	add("BINSERT",bInsert);
    	add("BDETAIL",bDetail);
    }
}