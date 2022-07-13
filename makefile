plan:
	terraform -chdir=terraform/ init
	terraform -chdir=terraform/ plan -out plan.tfplan

apply:
	terraform -chdir="terraform" apply -auto-approve 

destory:
	terraform -chdir="terraform" destroy -auto-approve