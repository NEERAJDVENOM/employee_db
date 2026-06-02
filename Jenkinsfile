pipeline {

    agent any

    environment {
        DB_HOST = 'employee.cb6e6aq6ueiq.ap-south-1.rds.amazonaws.com'
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
                        credentialsId: 'postgress-dev',
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
                        credentialsId: 'postgress-dev',
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
