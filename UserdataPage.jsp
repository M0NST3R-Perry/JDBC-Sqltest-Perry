<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ page import ="java.sql.*"%>>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

<% 
final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
final String DB_URL ="jdbc:mysql://localhost:8080/BoardGameProject_Test/HomePage.jsp";
final String USER ="root";
final String PASS ="MCU04132462Wu";
Connection conn = null;
Statement stmt= null; 

try {			
    //初始化驅動
	Class.forName("com.mysql.jdbc.Driver");
	//打開連結			
	System.out.println("Connecting to database..");						
	conn = DriverManager.getConnection(DB_URL,USER,PASS);
	//執行請求
	System.out.println("Creating statement...");
	stmt = conn.createStatement();
	String sql;
	sql = "SELECT UserID , UserName , UserGender FROM userdata";
	ResultSet rs = stmt.executeQuery(sql);
	
	//接收資料並儲存參數;
	while(rs.next()) {
		//可加其他儲存 看我自己找啥
		int UserID = rs.getInt("UserID");				
		String UserName = rs.getString("UserName");
		//顯示數值
		System.out.println("ID: "+ UserID);
		System.out.println("First: "+ UserName);				
	}
	//清理執行環境
	rs.close();
	stmt.close();
	conn.close();

} catch(SQLException se) {
    System.out.println("發生SQL錯誤");
} catch(Exception e) {
	System.out.println("發生錯誤");
	e.printStackTrace();
} finally {
	//阻擋未關閉的資源(先照打)
	try{
        if(stmt!=null)
           stmt.close();
     }catch(SQLException se2){
     }// nothing we can do
     try{
        if(conn!=null)
           conn.close();
     }catch(SQLException se){
        se.printStackTrace();
     }//end finally try
}
System.out.println("Goodbye!");     
%>
</body>
</html>