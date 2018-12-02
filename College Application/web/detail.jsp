
<%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"                                                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="home.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>

<style type="text/css">
  body{
    background-color: aliceblue; 
  }
    .header a{
    	cursor: pointer;
    }
 	.header{
 		    width: 949px;
    margin: auto;
    border-bottom: 1px solid #6669;
    padding: 12px 1px 20px 5px;
 	}
 	.header_title{
 		font-size: 21px;
        padding: 10px 10px 10px 10px;
 	}
 	.header_title i{
  		    border: 1px solid transparent;
    padding: 10px 40px 10px 40px;
    border-radius: 8px;
    background: #791d0e;
    color: wheat;	
        }
 	.header_details{
 		font-size: 21px;
        padding: 10px 10px 10px 10px;
 	}
 	.header_details i{
 		   border: 1px solid transparent;
    padding: 10px 40px 10px 40px;
    border-radius: 8px;
    background: #791d0e;
    color: wheat;
 	}
 	.header_apply{
 		font-size: 21px;
        padding: 10px 10px 10px 10px;
 	}
 	.header_apply i{
 		    border: 1px solid transparent;
    padding: 10px 40px 10px 40px;
    border-radius: 8px;
    background: #791d0e;
    color: wheat;
 	}
 	.header_user{
 		font-size: 21px;
        padding: 10px 10px 10px 10px;
 	}
 	.header_user i{
 		  border: 1px solid transparent;
    padding: 10px 40px 10px 40px;
    border-radius: 8px;
    background: #791d0e;
    color: wheat;
 	}
 	.header_logout{
 		font-size: 21px;
        padding: 10px 10px 10px 10px;
 	}
 	.header_logout i{
 		   border: 1px solid transparent;
    padding: 10px 40px 10px 40px;
    border-radius: 8px;
    background: #791d0e;
    color: wheat;
 	}
 </style>
</head>
<body>

</body>
<section id="b">

<div class="header">
    	<a class="header_title" href="home.html"><i class="fa fa-home">&nbsp&nbspHome</i></a>
        <a class="header_details" href="detail.jsp"><i class="fa fa-id-card">&nbsp&nbspDetails</i></a>
    	<a class="header_apply" href="apply.html"><i class="fa fa-wpforms">&nbsp&nbspApply</i></a>
    	<a class="header_user"><i class="fa fa-user">&nbsp&nbspUser</i></a>
    	<a class="header_logout" href="index.html"><i class="fa fa-sign-out">&nbsp&nbspLog Out</i></a>
    </div>

</section>
    <section id="s4">

<marquee direction="up" scrollamount="2">
<font size="5" color="green"><u><b>Recent Activity</b></u></font> 
<br><br>

    <h4>
        <br>
   Seating Plan for Sessional Test
    <br>
        <br>
    ECE Lab Reappear Schedule Nov 2018
    <br>
        <br>
    ECE Regular Lab Evalution 
    <br>
        <br>
    Transport Arrangment: 22th Nov 2
        <br>
        <br>
        Depature Time Of Buses From University
    </h4>
   
 
</marquee>
    <br>
    <br>
    <center>
<b>Suggestion Box:</b><textarea rows="19" cols="25">Enter your Suggestions....</textarea> 
<br>
    <button type="submit">Submit</button>
    
    

    <br><br>
    
<iframe src="https://calendar.google.com/calendar/embed?src=en.indian%23holiday%40group.v.calendar.google.com&ctz=America%2FLos_Angeles" style="border: 0" width="260" height="260" frameborder="0" scrolling="no"></iframe>
    </center>
    
    
</section>

<section id="s5">
    <center>    
        
 
 <br>
  <br>
   <br> <br>
   
 <br> <br> <br>
<% out.println(session.getAttribute("user")); %>

<form method="post">

<table border="2" align="center">
<tr>
<td>name</td>
<td>contact</td>
<td>country</td>
<td>address</td>
<td>university</td>
</tr>
<%
try
{
    String user = session.getAttribute("user").toString();
Class.forName("org.apache.derby.jdbc.ClientDriver");
String url="jdbc:derby://localhost:1527/data";
String username="root";
String password="qwerty";
String query="select * from data where first_name = '"+user+"'";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
    <tr>
        <td><% out.println(rs.getString("first_name")+" "+rs.getString("last_name")); %></td>
        <td><% out.println(rs.getString("contact")); %></td>
        <td><% out.println(rs.getString("country")); %></td>
        <td><% out.println(rs.getString("address")); %></td>
        <td><% out.println(rs.getString("university")); %></td>
    </tr>
        <%

}
%>
    </table>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>

</form>   
    </center>
</section>

    
    
    <section id="footer">
    
    <center>
<font size="5" ><b>Contact Us</b></font>
<font color="black">
<br>
Principal Tel No: 02-584710<br>
Principal Fax No: 02-584711<br>
Vice Principal Tel No: 02-584712<br>
Vice Principal Tel No: 02-584713<br>
Finance Officer Tel No: 02-584714<br>
Finance Officer Fax No: 02-584715<br>
Internet IT lab: 02-584718<br>
E-mail : uakp@druknet.bt
    </font></center>
<hr size="2" color="white">
<center> ©copyright2018,All rights reserved
<a href="#top">
<img src="top.png" width="25" height="25" align="right">
</a>
    </center>
</section>
    
    

</html>
