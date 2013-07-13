/*函数区域*/

function evenChange(obj) {
	$(""+obj+":nth-child(odd)").addClass("greyRow");
}

function overChange(obj) {
$(obj).each(function(i){
	$(obj).eq(i).hover(function(){
		$(this).addClass("over");
	},function(){
		$(this).removeClass("over"); });
	});
}






/*调用区域*/
$(document).ready(function(){

evenChange(".ul_list_b li");
evenChange("#sideNav>li");

if ($("#ul_mainNav").length) {
overChange("#ul_mainNav li");
}



if ($("#dl_commendNews").length) {
	var $title=$("#dl_commendNews .flashPage a");
	var $img=$("#dl_commendNews img");
	var  $dt=$("#dl_commendNews dt");
	var $ddDetails=$("#dl_commendNews .dd_commendDetails");
	var timeout;
	var a=1;
	var c = $title.size();

window.gg=function(index){
		$title.removeClass("now");
		$img.hide();
		$dt.hide();
		$ddDetails.hide();
		$($title.get(index)).addClass("now");	
		$($img.get(index)).show();
		$($dt.get(index)).show();
		$($ddDetails.get(index)).show();	
		
	}

	$title.hover(function() {
	var index = $title.index($(this));
	timeout =setTimeout("gg("+index+")", 200);
	a=index;
	},function() {
		clearTimeout(timeout);
	});
	$title.click(function() {
		var index = $title.index($(this));
		gg(index);
		a=index;
		return false;
	});

function autoRun(){
if(a<c){gg(a);a++;}else{gg(0);a = 1;}
}

var startRun = setInterval(autoRun,5000);


}


if($(".seo_links").length>0){
$(".seo_links").change(function(){
	if ($(this).val()!=0) {window.open($(this).val());}
})
}



if ($("#ul_galleryScroll li").length>4) {
	new Marquee("ul_galleryScroll",2,1,660,135,25,0,3000,144)
}




/*相册styleB*/ 
if($("#albumAbsBox").length>0){
var a=0;
var b=0;
var imgC=$("#ul_scoller img");
var c=$("#ul_scoller a").length;
var d=c-5;
var n;
var maxW=656;
var timeOut;

/*宽高自适应*/
function autoWH() {
$("#a_bigShow img").css({width:'auto',height:'auto'});
var w = $("#a_bigShow img").width();
var h = $("#a_bigShow img").height();
//alert(w+","+h);
if(w>maxW){h=maxW*h/w,w=maxW}
$("#a_bigShow img").css({width:w+"px",height:h+"px"});
}

/*主要变化函数*/
function changeMain(x) {
	var aRel=imgC.eq(x).attr("longdesc");
	var  photoDetails=$("#ul_scoller span").eq(x).html();
	$("#ul_scoller a").removeClass("now").eq(x).attr("class","now");
	$("#a_bigShow img").attr("src",aRel);
	$("#a_bigShow").attr("href",aRel);
	$("#p_photoDetails").html(photoDetails);
	$("#photoNow").text(x+1);
	var timeOut = setTimeout(autoWH,200);	
}

/*图片居中函数*/
function autoCenter(index) {
	n=index-2;
	if(n<0){$("#ul_scoller").animate({marginLeft:0}, "");	 a=0;	
	}else if(n>d){
	$("#ul_scoller").animate({marginLeft:-126*d}, "");	a=d;
	}else{
	$("#ul_scoller").animate({marginLeft:-126*n}, "");	a=index-2;
	}
}


/*初始化*/
$("#photoAll").text(c);
changeMain(0);


/*切换大图*/ 
$("#ul_scoller a").click(function(){
	var index = $("#ul_scoller a").index($(this));
	changeMain(index);
	b=index;
	return false;
})


/*上下按钮翻页*/
$("#a_photoPrev").click(function() {
	if (b>0) {b--;changeMain(b);}
	autoCenter(b);
	return false;
});

$("#a_photoNext").click(function() {
	if (b<c-1) {b++;changeMain(b);}
	autoCenter(b);
	return false;	
});


/*左右每点击一下，滚动一张*/ 

$("#aAPrev").click(function(){
if(a>0){
	$("#ul_scoller").animate({"marginLeft": "+=126"}, "");
	a--;
}
	return false;
});

$("#aANext").click(function(){
if (a<d){
	$("#ul_scoller").animate({"marginLeft": "-=126"}, "");
	a++;
}
	return false;
});


/*点击图片，图片居中*/ 
function absClickScoller() {
	$("#ul_scoller a").click(function(){
	var index = $("#ul_scoller a").index($(this));
	autoCenter(index);
	return false;	
});

}


/*条件判断，调用*/ 
if (c<5) {
	$("#aAPrev").hide();
	$("#aANext").hide()	;
}else{
	absClickScoller();/*点击图片，图片居中*/ 
}


}


if ($("#ul_temNav").length){

overChange("#ul_temNav li");

var l=$("#ul_temNav>li").length;
var w=parseInt(1002/l,10);
//alert(w);
$("#ul_temNav li").css({width:w});
$("#ul_temNav li a").css({width:w});
$("#ul_temNav li li a").css({width:w-1});
$("#ul_temNav li li ul").css({left:w,width:w});
$("#ul_temNav>li:last li ul").css({left:-w});

$("#ul_temNav").lavaLamp({
     fx: "backout", 
     speed: 700
//     click: function(event, menuItem) {
//     return false;
//    }
});
}














});


















