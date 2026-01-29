# 📝 JPA 기반 게시판 데이터베이스 설계 (Oracle)

이 저장소는 Java와 Database를 연동하는 **JPA 실습을 위한 Oracle SQL 스크립트**를 포함하고 있습니다. 
컴퓨터 전공자 및 시니어 입문자분들이 DB 구축 원리를 쉽게 이해할 수 있도록 구성되었습니다.


# SpringBott JPA 게시판

## 🖥️ 소개
JPA 방식으로 CURD 테스팅<br>

## 🕰️ 개발 기간
* 2026.01.29 - 2026.01.29

### ⚙️ 개발 환경
- 운영체제: Windows 11 home
- 개발 도구: SpringBoot 4.1.9
- JDK 버전: OpenJDK 21.0.6
- 프로그래밍 언어: Java 21
- 형상관리 도구: Git, GitHub

## 📌 주요 기능
#### 게시판 관리
- 게시판 입력 : 신규 입고 상품 선택 및 입고 정보 입력(텍스트 파일에 추가 및 저장)
- 게시판 수정 : 삭제대상 상품 선택 및 입고 재고에 대한 삭제/차감 처리(텍스트 파일에 삭제/차감 및 저장)
- 게시판 삭제 : 현재 재고 보유 상태 출력
- 게시판 리스트: 조회하고자 하는 특정 상품 선택 후 재고 보유 상태 출력
- 게시판 검색 : 재고 입고일자 기준으로 오름차순/내림차순 출력

## 🚀 데이타 베이스 정보
```sql
-- 스크립트 모드 활성화 (12c 이상)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- 기존 사용자 삭제 및 신규 생성
DROP USER KHH CASCADE; 
CREATE USER KHH IDENTIFIED BY KHH
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP; 

-- 필수 권한 부여
GRANT CONNECT, RESOURCE, DBA TO KHH;

# 🛠 2. 테이블 및 시퀀스 생성게시판의 핵심 정보를 저장할 테이블 구조와 게시글 번호 자동 증가를 위한 시퀀스입니다.
테이블 구조

컬럼명,타입,제약조건,설명
no,NUMBER,PRIMARY KEY,게시글 고유 번호
title,VARCHAR2(100),NOT NULL,글 제목
content,VARCHAR2(1000),,글 내용
writer,VARCHAR2(50),NOT NULL,작성자명
regdate,DATE,DEFAULT SYSDATE,등록 일시

SQLDROP TABLE jpaBoard;
CREATE TABLE jpaBoard( 
    no NUMBER, 
    title VARCHAR2(100) NOT NULL, 
    content VARCHAR2(1000), 
    writer VARCHAR2(50) NOT NULL, 
    regdate DATE DEFAULT SYSDATE,
    PRIMARY KEY(no) 
);

-- 시퀀스 생성 (1부터 시작)
DROP SEQUENCE jdbcBoard_seq;
CREATE SEQUENCE jdbcBoard_seq START WITH 1 INCREMENT BY 1; 

🔍 3. 주요 SQL 활용 예시
데이터 관리 (CRUD)
 데이터 입력: Board board = boardRepository.save(Board);
 전체 목록 조회: List<Board> boardList = boardRepository.findAll(Sort.by(Direction.DESC, "no")); 
 게시글 수정: Board board = boardRepository.getReferenceById(b.getNo());
		board.setContent(b.getContent());
		board.setTitle(b.getTitle());
		board.setWriter(b.getWriter());
 게시글 삭제:boardRepository.deleteById(board.getNo()); 
 검색 기능SQL-- 제목에 'b'가 포함된 게시글 검색
   boardRepository.findByContentContaining(keyword)

⚠️ 주의사항실습 중 데이터가 잘못되었다면 ROLLBACK;
명령어로 되돌릴 수 있습니다.
데이터 확정을 위해서는 COMMIT;
