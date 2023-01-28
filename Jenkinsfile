node {
    docker.image('maven:3.8.7-eclipse-temurin-11').inside('-v /root/.m2:/root/.m20') {
        
        stage('Build') {
                sh 'mvn -B -DskipTests clean package'
            }
        
        stage('Test') { 
  
            sh 'mvn test'
            
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            } 
  
        }
        
    }
}
