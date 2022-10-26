function boardWriteCheck(){
	document.getElementById("subjectDiv").innerText="";
	document.getElementById("contentDiv").innerText="";
	sw=0;
	if(document.getElementById("subject").value==""){
		document.getElementById("subjectDiv").innerText="제목을 입력하세요";
		sw=1;
	}
	if(document.getElementById("content").value==""){
		document.getElementById("contentDiv").innerText="내용을 입력하세요";
		sw=1;
	}
	if(sw==0) document.boardWriteForm.submit();
	
}






