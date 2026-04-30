package com.sist.vo;
import java.util.Date;
import lombok.Data;

/*
 * EMPNO    NOT NULL NUMBER       
   ENAME    NOT NULL VARCHAR2(50) 
   JOB      NOT NULL VARCHAR2(50) 
   HIREDATE NOT NULL DATE         
   SAL      NOT NULL NUMBER(10,2) 
   DEPTNO   NOT NULL NUMBER   
   
  부서 - 사워 -조인
 */
@Data
public class EmpVO {
    private int empno,sal,deptno;
    private String ename,job,dbday,isadmin;
    private Date hiredate;
    private DeptVO dvo = new DeptVO(); // 오라클에서는 조인 - 자바에서는 포함클래스라고 부름
}
