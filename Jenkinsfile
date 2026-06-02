pipeline {
    agent any

    environment {
        DB_HOST = 'your-rds-endpoint.amazonaws.com'
        DB_NAME = 'employee_db'
    }

    stages {
        stage('Flyway Migrate') {
            steps {

                withCredentials([
                    usernamePassword(
                        credentialsId: 'postgres-dev',
                        usernameVariable: 'DB_USER',
                        passwordVariable: 'DB_PASSWORD'
                    )
                ]) {

                    sh '''
                    echo "Running migration"

                    flyway \
                    -url=jdbc:postgresql://${DB_HOST}:5432/${DB_NAME} \
                    -user=$DB_USER \
                    -password=$DB_PASSWORD \
                    migrate
                    '''
                }
            }
        }
    }
}
