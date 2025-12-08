package org.example.web_project_3; // 실제 패키지 경로에 맞게 수정하세요.

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnectionTest {

    public static void main(String[] args) {
        // 1. Spring 설정 파일 경로 지정
        // 이 경로는 프로젝트 루트(프로젝트 최상위 폴더)를 기준으로 해야 합니다.
        // 예를 들어, 프로젝트 루트/src/main/webapp/WEB-INF/applicationContext.xml 일 경우:
        // C:\Users\joo\web_project_3\src\main\webapp\WEB-INF\applicationContext.xml

        // 실제 프로젝트 구조에 맞게 경로를 수정하세요.
        // 💡 주의: 이 예시는 로컬 파일 시스템 경로를 사용합니다.
        String contextPath = "file:src/main/webapp/WEB-INF/applicationContext.xml";

        // 2. ApplicationContext 로드
        // Spring 컨테이너가 applicationContext.xml을 읽고 Bean들을 초기화합니다.
        ApplicationContext context = new FileSystemXmlApplicationContext(contextPath);

        // 3. dataSource Bean 가져오기
        // Spring 컨테이너에서 id="dataSource"로 등록된 객체를 가져옵니다.
        DriverManagerDataSource dataSource = (DriverManagerDataSource) context.getBean("dataSource");

        // 4. 연결 테스트 수행
        try (Connection conn = dataSource.getConnection()) {
            // 연결이 성공적으로 이루어졌다면
            System.out.println("----------------------------------------------");
            System.out.println("✅ 데이터베이스 연결 성공!");
            System.out.println("데이터베이스: " + conn.getMetaData().getDatabaseProductName());
            System.out.println("접속 계정: " + conn.getMetaData().getUserName());
            System.out.println("----------------------------------------------");
        } catch (SQLException e) {
            // 연결 실패 시 (Access denied 등)
            System.err.println("----------------------------------------------");
            System.err.println("❌ 데이터베이스 연결 실패!");
            System.err.println("에러 메시지: " + e.getMessage());
            System.err.println("----------------------------------------------");
            // 디버깅을 위해 스택 트레이스를 출력합니다.
            e.printStackTrace();
        }
    }
}
/*
eof

## 2단계: 테스트 코드 실행 및 결과 확인

1.  **`DBConnectionTest.java` 파일을 실행**합니다. (IDE에서 `main` 메서드 우클릭 후 Run)
        2.  **콘솔 출력 결과**를 확인합니다.

        ### A. 연결 성공 시 출력

```text
----------------------------------------------
        ✅ 데이터베이스 연결 성공!
데이터베이스: MariaDB
접속 계정: W25_22300546
----------------------------------------------
        ```
        **결과:** DB 연결 정보(`username`, `password`, `url`)가 모두 올바르다는 뜻입니다.

        ### B. 연결 실패 시 출력 (Access Denied)

```text
----------------------------------------------
        ❌ 데이터베이스 연결 실패!
에러 메시지: (conn=...) Access denied for user 'W25_22300546'@'%' to database 'student'
        ----------------------------------------------
// ... (자바 예외 Stack Trace)
*/