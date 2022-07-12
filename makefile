plan:
	terraform -chdir=terraform/ init
	terraform -chdir=terraform/ plan -out plan.tfplan

apply:
	terraform apply -chdir="terraform" -auto-approve

destory:
	terraform destroy -chdir="terraform" -auto-approve