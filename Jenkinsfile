pipeline {
    agent any

    environment {
        DB_HOST = 'employee.cb6e6aq6ueiq.ap-south-1.rds.amazonaws.com'
        DB_NAME = 'employee_db'
        DB_PORT = '5432'
        FLYWAY_LOCATIONS = 'filesystem:sql'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Flyway Migrate') {
            steps {

                withCredentials([
                    usernamePassword(
                        credentialsId: 'postgress-dev',
                        usernameVariable: 'DB_USER',
                        passwordVariable: 'DB_PASSWORD'
                    )
                ]) {

                    sh '''
                    echo "Running Flyway Migration..."

                    flyway \
                      -url=jdbc:postgresql://${DB_HOST}:${DB_PORT}/${DB_NAME} \
                      -user=$DB_USER \
                      -password=$DB_PASSWORD \
                      -locations=$FLYWAY_LOCATIONS \
                      migrate
                    '''
                }
            }
        }

        stage('Flyway Info') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'postgress-dev',
                        usernameVariable: 'DB_USER',
                        passwordVariable: 'DB_PASSWORD'
                    )
                ]) {

                    sh '''
                    echo "Checking migration status..."

                    flyway \
                      -url=jdbc:postgresql://${DB_HOST}:${DB_PORT}/${DB_NAME} \
                      -user=$DB_USER \
                      -password=$DB_PASSWORD \
                      -locations=$FLYWAY_LOCATIONS \
                      info
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Migration completed successfully"
        }

        failure {
            echo "Migration failed — check logs"
        }
    }
}
