var control = "";

function moveWrite(bcode) {
	document.getElementById("bcode").value = bcode;
	document.getElementById("pg").value = "1";
	document.getElementById("key").value = "";
	document.getElementById("word").value = "";
	
	document.getElementById("commonForm").action = root + control + "/write.tfarm";
	document.getElementById("commonForm").submit();
}

function listArticle(bcode, pg, key, word) {
	document.getElementById("bcode").value = bcode;
	document.getElementById("pg").value = pg;
	document.getElementById("key").value = key;
	document.getElementById("word").value = word;
	
	document.getElementById("commonForm").action = root + control + "/list.tfarm";
	document.getElementById("commonForm").submit();
}

function viewArticle(bcode, pg, key, word, seq) {
	document.getElementById("bcode").value = bcode;
	document.getElementById("pg").value = pg;
	document.getElementById("key").value = key;
	document.getElementById("word").value = word;
	document.getElementById("seq").value = seq;
	
	document.getElementById("commonForm").action = root + control + "/view.tfarm";
	document.getElementById("commonForm").submit();
}