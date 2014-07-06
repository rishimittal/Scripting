



function validate(){
	
	//Validating name
	var name_len = document.my_form.username.value.length;
	if(name_len == 0){
		document.getElementById("valid_name").innerHTML="Missing field";
		document.my_form.username.focus();
		return false;
	}else{
		document.getElementById("valid_name").innerHTML="";
	}
	
	//Validating Date of Birth
	var mm = document.my_form.month.value;	
	var dd = document.my_form.day.value;
	var yyyy = document.my_form.year.value;	
	if(mm == 0 || dd == 0 || yyyy == 0){
		if(mm == 0){
			document.my_form.month.focus();
		}else if(dd == 0){
			document.my_form.day.focus();
		}else if(yyyy == 0){
			document.my_form.year.focus();
		}		
		document.getElementById("valid_date").innerHTML="Missing field";
		return false;
	}else{
		 document.getElementById("valid_date").innerHTML="";
	}
	if(yyyy%4 != 0) {
		if(mm == 2 && (dd == 29 ||dd == 30 || dd == 31)) {
			document.getElementById("valid_date").innerHTML="Invalid date";
                	return false;
		}else{
			 document.getElementById("valid_date").innerHTML="";
		}
	}else if(yyyy%4 == 0){
		if(mm == 2 && (dd == 30 || dd == 31)) {
                        document.getElementById("valid_date").innerHTML="Invalid date";
                        return false;
                }else{
                         document.getElementById("valid_date").innerHTML="";
                }

	}

	if(dd == 31  && (mm != 1 || mm != 3 || mm != 5 || mm != 7 || mm != 8 || mm != 10 || mm != 12)){
		 document.getElementById("valid_date").innerHTML="Invalid date";
                 return false;
        }else{
                 document.getElementById("valid_date").innerHTML="";
        }
	
	
	//Validating Password and Confirm Password
	
	var pass = document.my_form.password.value;
	var cpass = document.my_form.cpassword.value;
	var pass_len = document.my_form.password.value.length;
	var num = /[0-9]/;
	var alpha = /[a-zA-Z]/;
	var spchar = /[!@#$%^]/;
	var valid = num.test(pass) && alpha.test(pass) && spchar.test(pass);
	if(pass == ""){
		document.getElementById("valid_pass").innerHTML="Missing field";
                document.my_form.password.focus();
                return false;

	}else{
		document.getElementById("valid_pass").innerHTML="";
	
	}
	if(pass_len < 8 || !valid){
                document.getElementById("valid_pass").innerHTML="Invalid Password";
                document.my_form.password.focus();
                return false;

        }else{
                document.getElementById("valid_pass").innerHTML="";
                
        }     

	if(cpass == ""){
                document.getElementById("valid_cpass").innerHTML="Missing field";
                document.my_form.cpassword.focus();
                return false;

        }else{
                document.getElementById("valid_cpass").innerHTML="";
                
        }     

	if(pass != cpass){
                document.getElementById("valid_cpass").innerHTML="Passwords do not match";
                document.my_form.cpassword.focus();
                return false;

        }else{
                document.getElementById("valid_cpass").innerHTML="";
                
        }

	//Validating Sports
	var sport = document.my_form.sport.value;
	
	if(sport == 0){
                document.getElementById("valid_sport").innerHTML="Missing field";
                document.my_form.sport.focus();
                return false;

        }else{
                document.getElementById("valid_sport").innerHTML="";

        }
	
	//Validating Stadium
        var stadium = document.my_form.stadium.value;

        if(stadium == 0){
                document.getElementById("valid_stad").innerHTML="Missing field";
                document.my_form.stadium.focus();
                return false;

        }else{
                document.getElementById("valid_stad").innerHTML="";

        }

   	alert("YOUR FORM IS SUBMITTED");	
return true;
}

function addStadiums(){
	var sport = document.my_form.sport.value;
        var cricket = new Array('Select Stadium','Wankhede', 'Feroz Shah Kotla','Eden Garden');
        var football = new Array('Select Stadium','Old Trafford', 'San Siro', 'Camp nou');
        var tennis = new Array('Select Stadium','Arthur Stadium', 'Rod laver Arena', 'Perth Arena');

	switch(sport){
		case '0':
			document.my_form.stadium.options.length=0;
			createOption(document.my_form.stadium , 'Select Stadium', '0');
			break;
                 case 'cricket':
                        document.my_form.stadium.options.length=0;

                        for (i = 0; i < cricket.length; i++){
                                createOption(document.my_form.stadium , cricket[i], cricket[i]);
                        }
                        break;
                 case 'football':
			document.my_form.stadium.options.length=0;
                        for (i = 0; i < football.length; i++){
                                createOption(document.my_form.stadium , football[i], football[i]);
                        }
                        break;
		case 'tennis':
			document.my_form.stadium.options.length=0;
                        for (i = 0; i < tennis.length; i++){
                                createOption(document.my_form.stadium , tennis[i], tennis[i]);
                        }
                        break;
                default:
                        document.my_form.stadium.options.length=0;
                        break;
        }
	addImage(sport);

}

function createOption(ddl, text, value) {
        var opt = document.createElement('option');
        opt.value = value;
        opt.text = text;
        ddl.options.add(opt);
}

var val = 0;

function setDefaultImage(){
	var stadium = document.my_form.stadium.value;	
	var c =  document.getElementById('myCanvas');
	var ctx = c.getContext('2d');
	var img = new Image();
	if(stadium == "Feroz Shah Kotla"){
		img.src = "imagesQ3/FerozShahKotla.jpg"
		val = 2;
		document.getElementById('anchorID').style.visibility = 'visible';
		document.getElementById('anchor2ID').style.visibility = 'visible';
	}else if(stadium == "Wankhede"){
		img.src = "imagesQ3/Wankhede.jpg"
		val = 1;
		document.getElementById('anchorID').style.visibility = 'visible';
		document.getElementById('anchor2ID').style.visibility = 'hidden';
	}else if(stadium == "Eden Garden"){
                img.src = "imagesQ3/Edengardens.jpg"
		val = 3;
		document.getElementById('anchor2ID').style.visibility = 'visible';
		document.getElementById('anchorID').style.visibility = 'hidden';
        }else if(stadium == "Old Trafford"){
                img.src = "imagesQ3/OldTrafford.jpg"
		val = 1;
		document.getElementById('anchorID').style.visibility = 'visible';
        	document.getElementById('anchor2ID').style.visibility = 'hidden';
	}else if(stadium == "San Siro"){
                img.src = "imagesQ3/SanSiro.jpg"
		val = 2;
		document.getElementById('anchor2ID').style.visibility = 'visible';
		document.getElementById('anchorID').style.visibility = 'visible';
        }else if(stadium == "Camp nou"){
                img.src = "imagesQ3/CampNou.jpg"
		val = 3;
		document.getElementById('anchor2ID').style.visibility = 'visible';
		document.getElementById('anchorID').style.visibility = 'hidden';
        }else if(stadium == "Arthur Stadium"){
                img.src = "imagesQ3/ArthurAshe.jpg"
		val = 1;
		document.getElementById('anchor2ID').style.visibility = 'hidden';
		document.getElementById('anchorID').style.visibility = 'visible';
        }else if(stadium == "Rod laver Arena"){
                img.src = "imagesQ3/RodLaverArena.jpg"
		val = 2;
		document.getElementById('anchor2ID').style.visibility = 'visible';
		document.getElementById('anchorID').style.visibility = 'visible';
        }else if(stadium == "Perth Arena"){
                img.src = "imagesQ3/perthArena.jpg"
		val = 3;
		document.getElementById('anchor2ID').style.visibility = 'visible';
        	document.getElementById('anchorID').style.visibility = 'hidden';
	}
	img.onload = function () {
   	ctx.drawImage(img,0,0,c.width,c.height);
	}
}

function drawImage(imgT){
	var c =  document.getElementById('myCanvas');
        var ctx = c.getContext('2d');
        var img = new Image();
	img.src = imgT;	
	img.onload = function () {
        ctx.drawImage(img,0,0,c.width,c.height);
        }

}

function nextImage(){
	var sp = document.my_form.sport.value;
	document.getElementById('anchor2ID').style.visibility = 'visible';
	if(sp == "cricket"){
	if(val == 1 ){
		drawImage("imagesQ3/FerozShahKotla.jpg");
		val = 2;
	}else if(val == 2){
		drawImage("imagesQ3/Edengardens.jpg");
		val = 3;
		document.getElementById('anchorID').style.visibility = 'hidden';
	}
	}else if(sp == "football"){
		if(val == 1 ){
                	drawImage("imagesQ3/SanSiro.jpg");
                	val = 2;
        	}else if(val == 2){
                	drawImage("imagesQ3/CampNou.jpg");
                	val = 3;
                	document.getElementById('anchorID').style.visibility = 'hidden';
        	}
	}else if(sp == "tennis"){
		if(val == 1 ){
                        drawImage("imagesQ3/RodLaverArena.jpg");
                        val = 2;
                }else if(val == 2){
                        drawImage("imagesQ3/perthArena.jpg");
                        val = 3;
                        document.getElementById('anchorID').style.visibility = 'hidden';
                }

	}
}

function prevImage(){
	 document.getElementById('anchorID').style.visibility = 'visible';
	 var sp = document.my_form.sport.value;
        if(sp == "cricket"){
        if(val == 3 ){
                drawImage("imagesQ3/FerozShahKotla.jpg");
                val = 2;
        }else if(val == 2){
                drawImage("imagesQ3/Wankhede.jpg");
                val = 1;
                document.getElementById('anchor2ID').style.visibility = 'hidden';
        }
        }else if(sp == "football"){
                if(val == 3 ){
                        drawImage("imagesQ3/SanSiro.jpg");
                        val = 2;
                }else if(val == 2){
                        drawImage("imagesQ3/OldTrafford.jpg");
                        val = 1;
                        document.getElementById('anchor2ID').style.visibility = 'hidden';
                }
        }else if(sp == "tennis"){
                if(val == 3 ){
                        drawImage("imagesQ3/RodLaverArena.jpg");
                        val = 2;
                }else if(val == 2){
                        drawImage("imagesQ3/ArthurAshe.jpg");
                        val = 1;
                        document.getElementById('anchor2ID').style.visibility = 'hidden';
		 }
        }
}


