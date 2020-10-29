function trans(){
	if(document.wform.name.value==""){
		alert("이름을 입력하세요");
		document.wform.name.focus();
		return false;
	}
	if(document.wform.email.value==""){
		alert("이메일을 입력하세요");
		document.wform.email.focus();
		return false;
	}
	if(document.wform.title.value==""){
		alert("제목을 입력하세요");
		document.wform.title.focus();
		return false;
	}
	if(document.wform.content.value==""){
		alert("내용을 입력하세요");
		document.wform.content.focus();
		return false;
	}
	if(document.wform.pwd.value==""){
		alert("비밀번호를 입력하세요");
		document.wform.pwd.focus();
		return false;
	}
	document.wform.submit();
}

function editsend(idx){
	location.href="../boardUpdate/edit.jsp?idx="+idx;
}
function delsend(idx){
	location.href="../boardUpdate/del.jsp?idx="+idx;
}