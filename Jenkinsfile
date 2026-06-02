pipeline {

    agent any

    environment {
        DB_HOST = 'YOUR_RDS_ENDPOINT'
        DB_NAME = 'employee_db'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Validate') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'postgres-dev',
                        usernameVariable: 'DB_USER',
                        passwordVariable: 'DB_PASSWORD'
                    )
                ]) {

                    sh '''
                    flyway \
                    -url=jdbc:postgresql://${DB_HOST}:5432/${DB_NAME} \
                    -user=$DB_USER \
                    -password=$DB_PASSWORD \
                    -locations=filesystem:sql \
                    validate
                    '''
                }
            }
        }

        stage('Migrate') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'postgres-dev',
                        usernameVariable: 'DB_USER',
                        passwordVariable: 'DB_PASSWORD'
                    )
                ]) {

                    sh '''
                    flyway \
                    -url=jdbc:postgresql://${DB_HOST}:5432/${DB_NAME} \
                    -user=$DB_USER \
                    -password=$DB_PASSWORD \
                    -locations=filesystem:sql \
                    migrate
                    '''
                }
            }
        }
    }
}
