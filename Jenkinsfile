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
                sh './jenkins/scripts/kill.sh'
   
        }    
    
    stage('Deliver') { 
         
                sh './jenkins/scripts/deliver.sh'
                echo 'Waiting 5 minutes for deployment to complete prior starting smoke testing'
                sleep 60 // seconds
                echo 'pipeline success'
   
        }
}
