# POPCORN
Java와 Oracle, JSP, Servlet 기반의 영화 리뷰 웹사이트

## 🔅 핵심 기능

- 영화 리뷰
- 영화 3단계 평가
- 댓글 기능이 있는 계층형 게시판
- 영화 상세 정보 및 인기 순위


## 🔅 기본 정보
 - 진행 기간 : 2022.11.18~2022.11.24 (1주)
 - 참여 인원 : 5명

<hr>

## 🔅 개발 환경
- Back-end
  - Java 17
  - JSP, JSTL
  - Servlet
  - Oracle 21c
  - JavaScript & Jquery
  - Tomcat 9.0
 
- Front-end
  - HTML5
  - CSS


<hr>

## 🔅 서비스 흐름도

<img width="600" alt="image" src="https://user-images.githubusercontent.com/97737386/231753402-488c362b-827f-4f19-974d-febd92a03164.png">

<hr>

## 🔅 ER Diagram

![image](https://user-images.githubusercontent.com/97737386/231753360-4d16fd3c-5f2e-4b90-a6b0-588d00938392.png)

<hr>


## 🔅 담당 기능

(각 항목을 클릭하면 펼쳐집니다.)

- 각 기능 백엔드 / 프론트엔드 구현
- 기여도: 30%

<details>
  <summary><h3>마이페이지</h3></summary>
  
  ![image](https://user-images.githubusercontent.com/97737386/231753742-d66ffa42-9a90-4b54-bf38-9408e0e2eaca.png)
  
    - 회원정보와 내가 평가한 영화, 내가 쓴 리뷰, 내가 쓴 게시글 목록을 출력하는 페이지입니다.
    - 내가 쓴 리뷰 목록에서는 outer join을 이용해 내가 남긴 평가가 있을 경우 함께 출력, 없을 경우 리뷰만 출력했습니다.
     
  ![image](https://user-images.githubusercontent.com/97737386/231753990-6777ddda-edff-45d7-9873-cad2eb6d346a.png)

    - 내가 평가한 영화, 내가 쓴 리뷰, 내가 쓴 게시글 더보기 클릭 시 페이징 처리 혹은 무한스크롤 처리하여 데이터를 출력했습니다.
     
</details>

<details>
  <summary><h3>마이페이지 프로필</h3></summary>
  
  ![image](https://user-images.githubusercontent.com/97737386/231754149-dcdcbfef-59de-499e-8567-933e13e86dc4.png)
     
    - 프로필 사진, 닉네임, 비밀번호를 Ajax 혹은 Servlet을 이용해 각각 변경할 수 있게 했고 확인을 누르면 바로 반영되어 프로필 화면에 출력됩니다.
     
</details>

<details>
  <summary><h3>회원가입</h3></summary>
  
  ![image](https://user-images.githubusercontent.com/97737386/231754440-d9f95a08-ade5-4778-8c1b-cee87dd7e7f4.png)
     
    - Ajax를 이용해 비동기 방식으로 중복확인 결과가 바로 출력되도록 만들었습니다.
    - 중복확인과 비밀번호 확인이 완료되어야 가입하기가 실행됩니다.

</details>

<details>
  <summary><h3>로그아웃</h3></summary>
  
    - 로그아웃 시 세션에 저장된 로그인 정보를 삭제하고 메인페이지로 이동하도록 구현했습니다.

</details>
