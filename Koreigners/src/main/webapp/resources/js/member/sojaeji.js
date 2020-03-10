var sojaeji = function(sido, gugun, dong) {
	var obj = this;
	//window.onload = function() {
		obj.sido = document.getElementById(sido);
		obj.gugun = document.getElementById(gugun);
		obj.dong = document.getElementById(dong);
		obj.update_sido();
		obj.sido.onchange = function() {
			obj.update_gugun.apply(obj);
		}
	//}
}

sojaeji.prototype = {
	update_gugun : function() {
		if (this.gugun == null) return;
		var gugun = this[this.sido.value];
		this.gugun.innerHTML = "";
		for(var i=0; i<gugun.length; i++)
			this.gugun.options.add(new Option(gugun[i], gugun[i]));
	},
	update_sido : function() {
		if (this.sido == null) return;
		var sido = this['시도'];
		for(var i=0; i<sido.length; i++)
			this.sido.options.add(new Option(sido[i], sido[i]));
		this.update_gugun();
	},
 '시도' : ['Seoul','Busan','Daegu','Incheon','Gwangju','Daejeon','Ulsan','Gangwon','Gyeonggi','Gyeongsangnam-do','Gyeongsangbuk-do','Jeollanam-do','Jeonbuk','Jeju','Chungnam','Chungbuk','Sejong'],
 'Seoul' : ['Dobong-gu','Dongdaemun-gu','Dongjak-gu','Eunpyeong-gu','Gangbuk-gu','Gangdong-gu','Gangnam-gu','Gangseo-gu','Geumcheon-gu','Guro-gu','Gwanak-gu','Gwangjin-gu','Jongno-gu','Jung-gu','Jungnang-gu','Mapo-gu','Nowon-gu','Seocho-gu','Seodaemun-gu','Seongbuk-gu','Seongdong-gu','Songpa-gu','Yangcheon-gu','Yeongdeungpo-gu','Yongsan-gu'],
 'Busan' : ['Gangseo-gu','Geumjeong-gu','Nam-gu','Dong-gu','Dongnae-gu','Busanjin-gu','Buk-gu','Sasang-gu','Saha-gu','Seo-gu','Suyeong-gu','Yeonje-gu','Yeongdo-gu','Jung-gu','Haeundae-gu','Gijang-gun'],
 'Daegu' : ['Nam-gu','Dalseo-gu','Dong-gu','Buk-gu','Seo-gu','Suseong-gu','Jung-gu','Dalseong-gun'],
 'Incheon' : ['Gyeyang-gu','Nam-gu','Namdong-gu','Dong-gu','Bupyeong-gu','Seo-gu','Yeonsu-gu','Jung-gu','Ganghwa-gun','Ongjin-gun'],
 'Gwangju' : ['Gwangsan-gu','Nam-gu','Dong-gu','Buk-gu','Seo-gu'],
 'Daejeon' : ['Daedeok-gu','Dong-gu','Seo-gu','Yuseong-gu','Jung-gu'],
 'Ulsan' : ['Nam-gu','Dong-gu','Buk-gu','Jung-gu','Ulju-gun'],
 'Gangwon-do' : ['Chuncheon-si','Gangneung-si','Donghae-si','Samcheok-si','Sokcho-si','Wonju-si','Taebaek-si','Goseong-gun','Yanggu-gun','Yangyang-gun','Yeongwol-gun','Inje-gun','Jeongseon-gun','Cheorwon-gun','Pyeongchang-gun','Hongcheon-gun','Hwacheon-gun','Hoengseong-gun'],
 'Gyeonggi-do' : ['Suwon-si','Goyang-si','Gwacheon-si','Gwangmyeong-si','Gwangju-si','Guri-si','Gunpo-si','Gimpo-si','Namyangju-si','Dongducheon-si','Bucheon-si','Seongnam-si','Siheung-si','Ansan-si','Anseong-si','Anyang-si','Yangju-si','Yeoju-si','Osan-si','Yongin-si','Uiwang-si','Uijeongbu-si','Icheon-si','Paju-si','Pyeongtaek-si','Pocheon-si','Hanam-si','Hwaseong-si','Gapyeong-gun','Yangpyeong-gun','Yeoncheon-gun'],
 'Gyeongsangnam-do' : ['Changwon-si','Jinju-si','Sacheon-si','Gimhae-si','Miryang-si','Yangsan-si','Tongyeong-si','Geoje-si','Haman-gun','Changnyeong-gun','Uiryeong-gun','Goseong-gun','Namhae-gun','Sancheong-gun','Hapcheon-gun','Geochang-gun','Hamyang-gun','Hadong-gun'],
 'Gyeongsangbuk-do' : ['Pohang-si','Andong-si','Gumi-si','Gyeongju-si','Gyeongsan-si','Yeongju-si','Yeongcheon-si','Sangju-si','Mungyeong-si','Gimcheon-si','Chilgok-gun','Uiseong-gun','Seongju-gun','Goryeong-gun','Yecheon-gun','Bonghwa-gun','Uljin-gun','Yeongdeok-gun','Cheongsong-gun','Yeongyang-gun','Gunwi-gun','Cheongdo-gun','Ulleung-gun'],
 'Jeollanam-do' : ['Mokpo-si','Yeosu-si','Suncheon-si','Naju-si','Gwangyang-si','Damyang-gun','Gokseong-gun','Gurye-gun','Goheung-gun','Boseong-gun','Hwasun-gun','Jangheung-gun','Gangjin-gun','Haenam-gun','Yeongam-gun','Muan-gun','Hampyeong-gun','Yeonggwang-gun','Jangseong-gun','Wando-gun','Jindo-gun','Sinan-gun'],
 'Jeonbuk' : ['Jeonju-si','Gunsan-si','Iksan-si','Jeongeup-si','Namwon-si','Gimje-si','Wanju-gun','Jinan-gun','Muju-gun','Jangsu-gun','Imsil-gun','Sunchang-gun','Gochang-gun','Buan-gun'],
 'Jeju' : ['Jeju-si','Seogwipo-si'],
 'Chungnam' : ['Cheonan-si','Gongju-si','Asan-si','Boryeong-si','Seosan-si','Nonsan-si','Gyeryong-si','Dangjin-si','Buyeo-gun','Seocheon-gun','Cheongyang-gun','Hongseong-gun','Yesan-gun','Taean-gun','Geumsan-gun'],
 'Chungbuk' : ['Cheongju-si','Jecheon-si','Chungju-si','Goesan-gun','Danyang-gun','Boeun-gun','Yeongdong-gun','Okcheon-gun','Jeungpyeong-gun','Jincheon-gun']
}