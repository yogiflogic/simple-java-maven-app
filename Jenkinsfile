// node {
//     docker.image('maven:3.8.7-eclipse-temurin-11').inside('-v /root/.m2:/root/.m2') {
//         stage('Build') {
//                 sh 'mvn -B -DskipTests clean package'
//             }
        
//         stage('Test') { 
  
//                 sh 'mvn test'
//                 junit 'target/surefire-reports/*.xml' 
  
//         }
//     }
// }

// another way
node {

    // This step should not normally be used in your script. Consult the inline help for details.
    withDockerContainer('maven:3.8.7-eclipse-temurin-11') {
        // some block
        stage('Build') {
            checkout scm
            sh 'mvn -B -DskipTests clean package'
        }
    }
    withDockerContainer('maven') {
        // some block
        stage('Test') {
            checkout scm
            sh 'mvn test' 
            junit 'target/surefire-reports/*.xml'
        }
    }
    
    stage('Manual Approval') { 
         
                input message: 'Lanjutkan ke tahap Deploy?? (Klik "Proceed" untuk mengakhiri)' 
//                 sh './jenkins/scripts/kill.sh'
   
        }  
        
    withDockerContainer('maven:3.8.7-eclipse-temurin-11') {
            stage('Deploy') { 

                        sh './jenkins/scripts/deliver.sh'
//                         sleep 60 // seconds
                        echo 'Running App Done'
                        echo 'pipeline success'

                }
    }
        stage ("Build Images & Deploy To SRV2 AWS EC2") {
                
                sh 'docker ps -a'
                sh 'docker build -t yogiflogic/javamvn .'
                sh 'docker images'
                sh 'docker container create --name javamvn yogiflogic/javamvn'
                sh 'docker container start javamvn'
                sh 'docker container logs javamvn'
                echo 'Deploy To Other Server AWS Ec2'
                sh 'scp target/my-app-1.0-SNAPSHOT.jar root@ec2-13-213-4-71.ap-southeast-1.compute.amazonaws.com:/var/www/html'
                
        }
    
    
}
