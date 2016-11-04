<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Leave Management System| Admin Page</title>
		<!--  style sheets and font awesome  -->
		<link rel="stylesheet" href="assets/css/index.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
		<script src="dependencies/jquery.min.js"></script>
		<style>
		body {
		    font-family: "Lato", sans-serif;
		}

		</style>
	</head>
	<!--  Main section starts here for the webpage -->
	<body class="bodyClass">
		<div class="container-fluid">
			<div id="mySidenav" class="sidenav">
				<!-- <center><img src="https://d2q79iu7y748jz.cloudfront.net/s/_logo/e73546e57d7d852d4dd83de5e6cf3b29" class="head" width="90%"></center> -->
	  			<a href="#" class="demo"><h1><i class="fa fa-user" aria-hidden="true"></i></h1>Profile</a>
	  			<a href="#leaveDetail" class="demo"><h1><i class="fa fa-info" aria-hidden="true"></i></h1>Leave Details</a>
	  			<a href="#" class="demo"><h1><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></h1>Notifications</a>
	  			<a href="#" class="demo"><h1><i class="fa fa-wpforms" aria-hidden="true"></i></h1>Leave Apply</a>
	  			<a href="/Logout.do" class="demo"><h1><i class="fa fa-sign-out " aria-hidden="true" alt="logout"></i></h1>Logout</a>
			</div>
			
			<div class="col-md-offset-2 col-xs-offset-2 col-sm-offset-2 col-md-7 col-xs-10 col-sm-10 display" id="container">
			<div class="row" style="">
                <div class="col-md-12" id="primary-content">
                </div>

            </div>
			
			</div>
			
		</div>
<!--  templates from here to the script cdnjs s -->		
        <script type="text/jst" id="profileTemplate">
				<@ _.each(users,function(entry){ @>
				<table class="Table1">
					<h4>ABOUT <@= entry.get('firstName').toUpperCase() @><br /></h4>
					<hr Style="border:1px Solid grey">
					<tr><td class="td1">First Name &nbsp</td><td class="td2"><@= entry.get('firstName') @><br /></td></tr>
					<tr><td class="td1">Last Name </td><td class="td2"><@= entry.get('lastName') @><br /></td></tr>
					<tr><td class="td1">Email </td><td class="td2"><@= entry.get('email') @><br /></td></tr>
					<tr><td class="td1">Phone </td><td class="td2"><@= entry.get('phone') @><br /></td></tr>
					<tr><td class="td1">Date Of Birth </td><td class="td2"><@= entry.get('dateOfBirth') @><br /></td></tr>
					<tr><td class="td1">Gender </td><td class="td2"><@= entry.get('gender') @><br /></td></tr>
					
				</table>
				<br>
				<b>PROFESSIONAL DETAILS</b> <hr Style="border:1px Solid grey">
				<table class="Table1">
					<tr><td class="td1">Team &nbsp</td><td class="td2"><@= entry.get('team') @><br /></td></tr>
					<tr><td class="td1">Role </td><td class="td2"><@= entry.get('role') @><br /></td></tr>
					<tr><td class="td1">EmpCode </td><td class="td2"><@= entry.get('empCode') @><br /></td></tr>
					<tr><td class="td1">EmpId </td><td class="td2"><@= entry.get('empId') @><br /></td></tr>
					<tr><td class="td1">Date Of Join </td><td class="td2"><@= entry.get('dateOfJoin') @><br /></td></tr>
				</table>
				<br />
				<b>ACCOUNT DETAILS</b> <hr Style="border:1px Solid grey">
				<table class="Table1">
					<tr class="tr1"><td class="td1">Account Details &nbsp</td><td class="td2"><@= entry.get('accNum') @><br /></td></tr>
					<tr><td class="td1">Pan Number </td><td class="td2"><@= entry.get('panNo') @><br /></td></tr>
				</table>
				<br>
				<@ }); @>
		</script>
		
		<script type="text/jst" id="leaveTemplate">
				<table class="table">
				<thead class="thead thead-inverse">
				<tr><th>Leave Type</th><th>Entitled Leave</th><th>Leave Taken</th><th>Leave Remaining</th></tr>
				</thead>
				<tbody class="tbody1">
				<@ _.each(leaves,function(entry){ @>
					<tr>
						<th scope="row"><@= entry.get('leaveType') @></th>
						<td><@= entry.get('entitledLeave') @></td>
						<td><@= entry.get('leaveTaken') @></td>
						<td><@= entry.get('leaveRemaining') @></td>
					</tr>
				<@ }); @>
				</tbody>
				</table>
		</script>
		
		<script type="text/jst" id="notificationTemplate">
				<table class="table">
				<thead class="thead thead-inverse">
				<tr><th>Leave Type</th><th>Entitled Leave</th><th>Leave Taken</th><th>Leave Remaining</th></tr>
				</thead>
				<tbody class="tbody1">
				<@ _.each(leaves,function(entry){ @>
					<tr>
						<th scope="row"><@= entry.get('leaveType') @></th>
						<td><@= entry.get('entitledLeave') @></td>
						<td><@= entry.get('leaveTaken') @></td>
						<td><@= entry.get('leaveRemaining') @></td>
					</tr>
				<@ }); @>
				</tbody>
				</table>
		</script>
		
		
<!--  scripts starts form here -->		
		<script src="dependencies/underscore-min.js"></script>
        <script src="dependencies/backbone-min.js"></script>
 		<script src="backboneJs/Profile.js"></script>
 		<script src="backboneJs/Leave.js"></script>
 		<script src="assets/nanobar/nanobar.js"></script>
	
 		<script>
	 	_.templateSettings = { 
	 		    interpolate: /\<\@\=(.+?)\@\>/gim,
	 		    evaluate: /\<\@([\s\S]+?)\@\>/gim,
	 		    escape: /\<\@\-(.+?)\@\>/gim
	 		};

			var simplebar = new Nanobar();
			simplebar.go(100);
		</script>
 		
	</body>
</html>