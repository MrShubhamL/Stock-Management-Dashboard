var a = parseFloat(document.getElementById("gstPercent").value);
	var b = parseFloat(document.getElementById("TotalAmount").value);
	if(a==5){
	var result2 = parseFloat((b/105)*100).toFixed(2);
	document.getElementById("netAmo").innerHTML = result2;
	var b = parseFloat(document.getElementById("TotalAmount").value);
	var c = parseFloat(b-result2);
	var d = parseFloat(c/2).toFixed(2);
	document.getElementById("cgstAm").innerHTML = d;
	document.getElementById("sgstAm").innerHTML = d;
	
	
	var gst = parseFloat(a/2);
	document.getElementById("CGST").innerHTML = gst;
	document.getElementById("SGST").innerHTML = gst;
	}
	else if(a==12){
	var result2 = parseFloat((b/112)*100).toFixed(2);
	document.getElementById("netAmo").innerHTML = result2;
	var b = parseFloat(document.getElementById("TotalAmount").value);
	var c = parseFloat(b-result2);
	var d = parseFloat(c/2).toFixed(2);
	document.getElementById("cgstAm").innerHTML = d;
	document.getElementById("sgstAm").innerHTML = d;
	
	
	var gst = parseFloat(a/2);
	document.getElementById("CGST").innerHTML = gst;
	document.getElementById("SGST").innerHTML = gst;
	}
	else if(a==18){
	var result2 = parseFloat((b/118)*100).toFixed(2);
	document.getElementById("netAmo").innerHTML = result2;
	var b = parseFloat(document.getElementById("TotalAmount").value);
	var c = parseFloat(b-result2);
	var d = parseFloat(c/2).toFixed(2);
	document.getElementById("cgstAm").innerHTML = d;
	document.getElementById("sgstAm").innerHTML = d;
	
	
	var gst = parseFloat(a/2);
	document.getElementById("CGST").innerHTML = gst;
	document.getElementById("SGST").innerHTML = gst;
	}
	else{
		var result2 = parseFloat(0);
		var b = parseFloat(document.getElementById("TotalAmount").value);
		document.getElementById("netAmo").innerHTML = b;
		var c = parseFloat(b);
		document.getElementById("cgstAm").innerHTML = result2;
		document.getElementById("sgstAm").innerHTML = result2;
		
		document.getElementById("CGST").innerHTML = result2;
		document.getElementById("SGST").innerHTML = result2;
	}