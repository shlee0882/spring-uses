## Spring Framework, RESTful API, Open API를 활용한 사이드 프로젝트 

[![Build Status](https://travis-ci.org/shlee0882/burgerInfo-spring-project.svg?branch=master)](https://travis-ci.org/shlee0882/burgerInfo-spring-project)

- 배포 된 url : 
  - http://15.165.192.73:8080

- RESTful API : 
  - 조회 : [GET] : http://15.165.192.73:8080/burgers

- 사용 기술 : 
  - Spring Framework
  - AWS EC2(ubuntu linux 18.04)
  - AWS RDS(mariadb)
  - imgurAPI(open api image upload)

- 서비스 내용 :
  - 사용자는 조건에 맞게 자신의 햄버거를 찾을 수 있다.
  - 관리자는 admin page에서 전시정보, 상품정보를 등록/조회/변경/삭제 할 수 있다.
  - (admin id : admin /pw : 123 )

- 개발 참여자
  - 1인 개발

- 개발기간 :
  - 2019/03/06 ~ 2019/03/20 (약 3주)
  - 2020/04/15 ~ 2020/04/16 젠킨스 적용
  
- 개발적인 설명 : 
  - sts, jdk 1.8, maven, lombok을 사용했습니다.
  - jUnit4를 사용하여 bean설정, db연결 등을 테스트 주도 개발적으로 진행하였습니다. 
  - 관리자 로그인 영역은 session과 cookie를 사용해 구현하였습니다.
  - 상품 이미지 등록 및 변경은 imgur OpenAPI를 사용하여 업로드되면 DB에 업로드된 URL이 저장됩니다.
  - mariaDB의 테이블은 전시, 브랜드, 상품, 선택메뉴, 관리자로 구성되어있습니다.
  - 화면은 main페이지, login페이지, 관리자 조회/등록 페이지, 에러 404 page가 있습니다
  - 프론트는 bootstrap theme기반으로 필요한 component를 찾아서 새롭게 커스터마이징 하였습니다.
  - open API로 GET 방식의 상품 조회 API를 제공합니다.
  
- 젠킨스 통합관리
  - 빌드 배포 자동화 툴을 적용해 빌드시 war로 생성되어 자동deploy합니다. 
  - http://15.165.192.73:8080/jenkins/
  - admin / 0882
  
- travis ci 적용
  
- 기타 :
  - 현재 등록된 상품은 테스트 데이터라 정확한 정보를 제공하지 않습니다.
  - 탄력적으로 aws ec2 서버를 운용하여 접속이 원활하지 않을 수 있습니다.

- 프로젝트 기술 문서 [다운로드](./burger_document.pdf)
