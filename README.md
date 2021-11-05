FORK된 해당 프로젝트는 국비지원 교육시 Final Project로 진행한 작업물 입니다. 😃 

팀원들의 작업물이 전체로 올라와 있어
1. 프로젝트 전체 설명
2. 제가 작업한 작업물 경로와 설명
을 해보도록 하겠습니다.

&nbsp;

## 1. 어떤 프로젝트 인가? 
Final Project 진행 당시 특별한 아이디어가 없었던 저희 팀은
다들 한번씩 개발해보고 싶다던, **에어비앤비** 사이트를 모방하여 만들었습니다.

&nbsp;

당시 개발에 대해 좀더 잘 알던 팀원분들이 
- 숙소 생성 기능
- 지도 클러스터러 기능

등 다소 어려운 작업을 맡았고

&nbsp;

나머지 팀원분들은 그외 기능들을 분담해서 작업을 하였습니다.

&nbsp;

## 2-1. 나의 작업은?
저는 당시 개발실력이 뛰어난 편은 아니었지만
해보지 않은 것에 도전해보고 싶은 마음이 커서
**예약 / 결제 페이지 구현과 기능**을 담당하였습니다.

&nbsp;

## 2-2. 개발 환경 / 기술 스택은?
**개발환경**

- STS 
- Apache Tomcat 8.0
- jsp
- Mybatis
- maven

**기술 스택**

- Java(jdk 1.8.0)
- spring Framework / MVC 아키텍처 패턴 
- Oracle DB
- vanila javascript
- jQuery
- HTML5
- CSS

&nbsp;

## 2-3. 나의 작업 파일 경로
**spring**

- controller : https://github.com/junkahyun/FinalProject/tree/master/FinalProject/src/main/java/com/spring/bnb/controller/KHController.java
- dao(인터페이스) :  https://github.com/junkahyun/FinalProject/tree/master/FinalProject/src/main/java/com/spring/bnb/dao/InterKHDAO.java
- dao : https://github.com/junkahyun/FinalProject/tree/master/FinalProject/src/main/java/com/spring/bnb/dao/KHDAO.java
- service(인터페이스) : https://github.com/junkahyun/FinalProject/tree/master/FinalProject/src/main/java/com/spring/bnb/service/InterKHService.java
- service : https://github.com/junkahyun/FinalProject/tree/master/FinalProject/src/main/java/com/spring/bnb/service/KHService.java
- mapper(mybatis) : https://github.com/junkahyun/FinalProject/tree/master/FinalProject/src/main/java/com/spring/bnb/mapper/kh.xml

&nbsp;

**jsp**

- https://github.com/junkahyun/FinalProject/tree/master/FinalProject/src/main/webapp/WEB-INF/views/notiles/reservationAndPay

&nbsp;

## 2-4. 완성된 화면
<details>
  <summary>숙소 이용 규칙 확인 화면</summary>
  <br />
  <div markdown="1">
    <image src="https://github.com/junkahyun/KHFinalProject/blob/master/screenimage/roomRuels_check.PNG" />
  </div>
</details>
<details>
  <summary>일행 확인 화면</summary>
  <br />
  <div markdown="1">
    <image src="https://github.com/junkahyun/KHFinalProject/blob/master/screenimage/people_check.PNG" />
  </div>
</details>
<details>
  <summary>예약 정보 확인 화면</summary>
  <br />
  <div markdown="1">
    <image src="https://github.com/junkahyun/KHFinalProject/blob/master/screenimage/reserve_check.PNG" />
  </div>
</details>
<details>
  <summary>쿠폰 선택 팝업 화면</summary>
  <br />
  <div markdown="1">
    <image src="https://github.com/junkahyun/KHFinalProject/blob/master/screenimage/coupon_use.PNG" />
  </div>
</details>
<details>
  <summary>결제 팝업 화면</summary>
  <br />
  <div markdown="1">
    <image src="https://github.com/junkahyun/KHFinalProject/blob/master/screenimage/reserve_popup.PNG" />
  </div>
</details>
<details>
  <summary>예약 완료 화면</summary>
  <br />
  <div markdown="1">
    <image src="https://github.com/junkahyun/KHFinalProject/blob/master/screenimage/reserve_succes.PNG" />
  </div>
</details>
<details>
  <summary>예약 확정 이메일 화면</summary>
  <br />
  <div markdown="1">
    <image src="https://github.com/junkahyun/KHFinalProject/blob/master/screenimage/reserve_email.PNG" />
  </div>
</details>
