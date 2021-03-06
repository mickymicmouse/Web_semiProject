<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

<style>
.select_img img {
	margin: 20px 0;
}
</style>
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-175462567-1"></script>
<script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-175462567-1');
        </script>
</head>
<body>
	<%@ include file="home.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="row">

			<form action="crazywriteaction.do" style="color: #D9418C;"
				method="post" enctype="multipart/form-data">
				<table class="table table-striped"
					style="border: 2px solid #FFFFFF; text-align: center; background-color: white;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">글쓰기</th>
						</tr>
					</thead>
					<tr>
						<td><input type="text" placeholder="subject" id="subject"
							name="subject" class="form-control"></td>
					</tr>
					<tr>
						<td><textarea rows="10" class="form-control"
								placeholder="content" id="content" name="content"></textarea></td>
					</tr>
					<tr></tr>
					<tr>
						<td><div class="inputArea">
								<label for="imagePreview">이미지</label>
								<div id="divimageid">
									<input type="file" id="imageUpload" name="file"
										style="display:none;">
								</div>
								<div>
									<img id="imagePreview" />
								</div>
								<button type="button" class="btn btn-success"
									onclick="imageUpload.click()" style="margin: 20px">이미지
									업로드</button>
								<button type="button" class="btn btn-success" id="delbutton"
									style="display: none">이미지 삭제</button>
							</div></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="card" style="margin: 30px;">
								<div id="label-container"></div>
							</div>

						</td>
					</tr>

					<tr>
						<td><textarea rows="2" class="form-control"
								placeholder="description" id="description" name="description"
								style="display: none;"></textarea></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" id="change"
							style="background-color: #D9418C; color: white;"
							class="btn btn-default pull-right" value="등록" /> <input
							type="button" style="background-color: #D9418C; color: white;"
							class="btn btn-default pull-right"
							onclick="javascript:location.href='crazyboard.do'" value="글목록" />
						</td>
					</tr>

				</table>

			</form>
		</div>
	</div>




	<c:if test="${msg=='error'}">
		<script type="text/javascript">
			alert("내용을 입력하세요");
		</script>
	</c:if>


	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v8.0"
		nonce="HFQk7fNn"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>



	<div class="fb-comments" data-href="https://bokyeong-kim.github.io/"
		data-numposts="5" data-width=""></div>

	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>


	<script type="text/javascript">
            const URL = '/crazy/resources/my_model/';
		
            let model, webcam, labelContainer, maxPredictions;

            var labeling = {
                    김치볶음밥: { kcal: 495, comment: '= 런닝머신 31분 하기' },
                    간장게장: { kcal: 397, comment: '= 스쿼트 267분 하기' },
                    갈비찜: { kcal: 530, comment: '= 등산 130분 하기' },
                    공기밥: { kcal: 313, comment: '= 윗몸일으키기 119분 하기' },
                    김밥: { kcal: 240, comment: '= 계단 36분 걷기' },
                    녹차라떼: { kcal: 88.7, comment: '= 1개 먹을때마다 37분 요가하기' },
                    돈가스: { kcal: 446, comment: '= 51분동안 수영하기' },
                    된장찌개: { kcal: 310, comment: '= 런닝머신 31분 하기' },
                    떡볶이: { kcal: 1800, comment: '= 스쿼트 267분 하기' },
                    라면: { kcal: 1000, comment: '= 등산 130분 하기' },
                    막창: { kcal: 918, comment: '= 윗몸일으키기 119분 하기' },
                    맥주: { kcal: 240, comment: '= 계단 36분 걷기' },
                    미역국: { kcal: 88.7, comment: '= 1개 먹을때마다 37분 요가하기' },
                    바나나: { kcal: 446, comment: '= 51분동안 수영하기' },
                    방울토마토: { kcal: 310, comment: '= 런닝머신 31분 하기' },
                    붕어빵: { kcal: 1800, comment: '= 스쿼트 267분 하기' },
                    비빔밥: { kcal: 1000, comment: '= 등산 130분 하기' },
                    닭발: { kcal: 918, comment: '= 윗몸일으키기 119분 하기' },
                    사과: { kcal: 240, comment: '= 계단 36분 걷기' },
                    삼계탕: { kcal: 88.7, comment: '= 1개 먹을때마다 37분 요가하기' },
                    삼겹살: { kcal: 446, comment: '= 51분동안 수영하기' },
                    소주: { kcal: 310, comment: '= 런닝머신 31분 하기' },
                    순대: { kcal: 1800, comment: '= 스쿼트 267분 하기' },
                    스콘: { kcal: 1000, comment: '= 등산 130분 하기' },
                    스테이크: { kcal: 918, comment: '= 윗몸일으키기 119분 하기' },
                    아이스아메리카노: { kcal: 240, comment: '= 계단 36분 걷기' },
                    연어회: { kcal: 88.7, comment: '= 1개 먹을때마다 37분 요가하기' },
                    오므라이스: { kcal: 446, comment: '= 51분동안 수영하기' },
                    와플: { kcal: 1000, comment: '= 등산 130분 하기' },
                    우유: { kcal: 918, comment: '= 윗몸일으키기 119분 하기' },
                    조각케이크: { kcal: 240, comment: '= 계단 36분 걷기' },
                    짜장면: { kcal: 88.7, comment: '= 1개 먹을때마다 37분 요가하기' },
                    초밥: { kcal: 446, comment: '= 51분동안 수영하기' },
                    치킨: { kcal: 310, comment: '= 런닝머신 31분 하기' },
                    칼국수: { kcal: 1800, comment: '= 스쿼트 267분 하기' },
                    캔콜라: { kcal: 1000, comment: '= 등산 130분 하기' },
                    피자: { kcal: 918, comment: '= 윗몸일으키기 119분 하기' }
                };
			
            var randomtxt = ['먹어봤자 내가 아는 그맛이다'
                , '뚱뚱하면 굶어서라도 빼야한다.'
                , '인생은 살이 쪘을 때와 안 쪘을 때로 나뉜다.'
                , '세 끼 다먹으면 살쪄요'
                , '처먹지를 말던가 살쪘다고 징징대지를 말던가'
                , '그 몸무게가 사람이냐? -강천성(짐승)'
                ,'먹는거? 귀찮아서요..'
                ,'간단해요. 그것이 흔들리면 지방이에요.'
                ,'땀은 지방이 흘리는 눈물이다.'
                ,'여우같이 되려면 돼지 같이 땀 흘려라'
                ,'승자는 길을 찾고, 패자는 핑계거리를 찾는다.'
                ,'다이어트는 식이조절 70%, 운동 30% 복근은 부엌에서 만들어진다.'
                ,'바라지만 말고 실천하라'
                ,'비만의 괴로움이 운동의 괴로움보다 훨씬 크다.'
                ,'기분 나쁜 날이 운동하기 좋은 날이다.'
                ,'입의 즐거움은 잠깐이지만, 엉덩이의 지방은 평생이다.'
                ,'한번 사는 인생이다. 폼나게 살고 싶지 않은가?'
                ,'남들이 사랑하길 바라기 전에 나부터 스스로를 사랑하자.'
                ,'먹어서 살이 찌는게 아니라 많이 먹어서 살이 찌는 것이다.'
                ,'나를 배부르게 하는 것들이 나를 괴롭힌다.'
                ,'체중은 반드시 아는만큼 빠진다.'
                ,'왜 영양가가 없는 쓰레기 음식을 입에 넣는가? 당신의 배는 쓰레기통이 아니다. 당신이 먹는 것이 곧 당신이다.'
                ,'식이 조절을 못하면 운동을 열심히 해봐야 소용없다'
                ,'뇌세포는 죽지만 비만세포는 죽지 않는다.'
                ,'날씬한 것만큼 맛있는 건 없다.'
                ,'죽을만큼 운동하고 죽지않을 만큼 먹었어요.'
                ,'진정한 여자는 태어나는 것이 아니라 만들어지는 것이다.'
                ,'다이어트란 체중감량이 아니라 사이즈의 축소이다.'
                ,'세상의 변화된 시선과 대우를 꿈꾸어라. 그 꿈을 현실로 만들어라'
                ,'실패는 일어설 수 있지만, 포기는 일어설 수 없다.'
                ,'아침은 공주처럼 점심은 시녀처럼 저녁은 거지처럼 먹어라'
                ,'배고플 때 자라 거짓 배고픔은 갈증으로 채워라'
                ,'먹기위해 사는 것이 아니다. 살기위해 먹는다는 것을 인지해라.'
                ,'맛과 멋은 음식 자체에만 존재한다. 몸에는 적용되지 않는다.'
                ,'몸매가 패션이고 몸이 스타일이다.'
                ,'돈주고 살찌는 것보다 남기는게 낫다.'
                ,'맛과 멋은 같이 갈 수 없다.'
                ,'먹어라 세상은 네가 돼지가 되든 말든 상관 안하지만 후회는 할 것이다.'
                ,'일하는 것을 귀찮아 하지 말고 먹는 것을 귀찮아 해라'
                ,'지금도 먹고 있는가? 그것은 지방이다.'
                ,'살찌는 건 한순간 살빼는건 피눈물'
                ,'인생을 걸고 다이어트를 해라'
                ,'하루에 3분, 거울 앞에서 냉철한 자기관리의 시간을 가져라'
                ,'살을 빼고 나면 살쪘던 것을 후회하게 된다.'
                ,'세상의 변화된 시선과 대우를 꿈꿔라'
                ,'이 정도는 먹어도 될 것이다라는 합리화나 자신에게 관대하지 마라'
                ,'세상에서 가장 안전한 성형은 다이어트이다.'
                ,'음식은 맛있을수록 칼로리도 높아지는 것이다.'
                ,'인생은 살이 쪘을 때와 안 쪘을 때로 나눠진다'
                ,'다이어트의 불편함이 다이어트 후의 편안함을 불러온다'
           
                		];
            
            async function init() {
                const modelURL = URL + 'model.json';
                const metadataURL = URL + 'metadata.json';

                console.log(modelURL);
                console.log(metadataURL);
                model = await tmImage.load(modelURL, metadataURL);
                console.log(model);
                maxPredictions = model.getTotalClasses();

			}
            
            async function predict() {
            	
            	console.log('predict');
                var image = document.getElementById('imagePreview');
                console.log(image);
                const prediction = await model.predict(image, false);
                
				var maxProb = 0;
				var bestClassName;
				var randomLen = randomtxt.length;
				var randomContent = Math.round(Math.random()*(randomLen-1));
				
				
                for (let i = 0; i < maxPredictions; i++) {
					if(prediction[i].probability > maxProb) {
						
					   maxProb = prediction[i].probability.toFixed(2)*100;
					   bestClassName = prediction[i].className;

					   var labelObj = labeling[bestClassName];

                }
            }
                if (labelObj==null){
            		console.log('음식 없음');
            		document.getElementById('label-container').innerHTML = "";
                	document.getElementById('description').value = "";
                }else{
                	console.log(labelObj);
    				console.log(bestClassName);
                    document.getElementById('label-container').innerHTML = '<h3>AI 분석결과</h3>'+'<br>'+bestClassName + ' : ' +labelObj.kcal +'kcal' +'<br>' + labelObj.comment + '<br><br><b>' + randomtxt[randomContent]  + '</b>';
                	document.getElementById('description').value = '<h3>AI 분석결과</h3>'+'<br>'+bestClassName + ' : ' +labelObj.kcal +'kcal' +'<br>' + labelObj.comment + '<br><br><b>' + randomtxt[randomContent]  + '</b>';
                }
            }
        </script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    console.log($('#imageUpload').val());
                    reader.onload = function (e) {
                    	$('#imagePreview').removeAttr('src');
                    	$('#imagePreview').removeAttr('style');
                    	$('#imagePreview').attr('style', 'height: 300px; border-radius: 20px; margin: 20px');
                        $('#imagePreview').attr('src', e.target.result);
                        $('#imagePreview').hide();
                        $('#imagePreview').fadeIn(250);
                    };
                    reader.readAsDataURL(input.files[0]);
                    
                    init().then(() => {
                        predict();
                    });
                }
            }
            
            function showbutton(){
            	
           		$('#delbutton').removeAttr('style');
           		$('#delbutton').attr('style', 'margin: 20px' )
            }
            
            function removebutton(){
           		$('#delbutton').removeAttr('style');
           		$('#delbutton').attr('style', 'display:none' );	
            }
            
            function deleteimage(){
            	console.log($('#imageUpload').val());
            	$('#imagePreview').removeAttr('src');
            	$('#imagePreview').removeAttr('style');
            	$('#imagePreview').attr('src','/crazy/resources/images/none.png');
            	$('#imagePreview').attr('style','display:none');
            	document.getElementById('label-container').innerHTML = "";
            	document.getElementById('description').value = "";
            	$('#imageUpload').val("");
            	
            	removebutton();
            }
           	
            
            function checkSubject(){
            	var subject = $('#subject').val();
            	if (subject==''){
            		alert('제목을 입력하세요');
            	}else{
            		alert('등록되었습니다');
            	}
            }
            
            $('#imageUpload').change(function () {

                readURL(this);
                showbutton();
            });
            
            
            $('#delbutton').click(function () {
            	alert('삭제되었습니다.');
            	deleteimage();
            	
            	
            });
            
            $('#change').click(function() {
            	checkSubject();
            	
            });
        </script>



</body>
</html>