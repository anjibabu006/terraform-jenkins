node {
    stage('Checkout') {
        git branch: 'main', url: 'https://github.com/anjibabu006/terraform-jenkins.git'
    }

    stage('Terraform Init') {
        // Pass Jenkins job name as workflow_name variable
        sh """
          terraform init \
          -backend-config="key=terraform/${env.JOB_NAME}/terraform.tfstate" \
          -reconfigure
        """
    }

    stage('Terraform Plan') {
        sh "terraform plan -var workflow_name=${env.JOB_NAME} -out=tfplan"
    }

    stage('Approval') {
        input message: "Approve Terraform Apply for job ${env.JOB_NAME}?", ok: "Apply"
    }

    stage('Terraform Apply') {
        sh "terraform apply -auto-approve tfplan"
    }
}
