<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	if(${msg != null}){
		alert("${msg}");
	}
	if(${reload != null }) location.reload();
	else location.href = "${loc}"
});
</script>