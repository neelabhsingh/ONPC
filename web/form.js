var xmlhttp

function getForm(str) {
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null) {
        alert ("Your browser does not support AJAX!");
        return;
    }
    
    var url="getForm.jsp";
    url=url+"?q="+str;
    url=url+"&sid="+Math.random();
    xmlhttp.onreadystatechange=stateChanged;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function chkid(str) {
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null) {
        alert ("Your browser does not support AJAX!");
        return;
    }
    
    var url="chkId.jsp";
    url=url+"?q="+str;
    url=url+"&sid="+Math.random();
    xmlhttp.onreadystatechange=stateChanged;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function stateChanged()
{
    if (xmlhttp.readyState==3) {
        document.getElementById("form").innerHTML="<img src=\"loading.gif\">";
    }    
    if (xmlhttp.readyState==4) {
        document.getElementById("form").innerHTML=xmlhttp.responseText;
    }
}

function GetXmlHttpObject() {
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari  
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject) {
        // code for IE6, IE5  
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}