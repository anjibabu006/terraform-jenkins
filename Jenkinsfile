node {
    stage('Checkout') {
        git branch: '${env.BRANCH_NAME}', url: 'https://github.com/anjibabu006/terraform-jenkins.git'
    }

    stage('Terraform Init') {
        // Pass Jenkins job name as workflow_name variable
        sh """
          terraform init \
          -backend-config="key=terraform/${env.BRANCH_NAME}/terraform.tfstate" \
          -reconfigure
        """
    }
    stage('Check Tools') {
        // Check Terraform installation and version
        sh '''
          if ! command -v terraform &> /dev/null
          then
            echo "❌ Terraform is not installed!"
            exit 1
          else
            echo "✅ Terraform version:"
            terraform version
          fi

          if ! command -v aws &> /dev/null
          then
            echo "❌ AWS CLI is not installed!"
            exit 1
          else
            echo "✅ AWS CLI version:"
            aws --version
          fi
        '''
    }
    stage('Terraform Plan') {
        sh "terraform plan -var workflow_name=${env.BRANCH_NAME} -out=tfplan"
    }

    stage('Approval') {
        input message: "Approve Terraform Apply for job ${env.JOB_NAME}?", ok: "Apply"
    }

    stage('Terraform Apply') {
        sh "terraform apply -auto-approve tfplan"
    }
}
