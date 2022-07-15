TERRAFORM_PATH = terraform
TERRAFORM = terraform -chdir=$(TERRAFORM_PATH)/

plan:
	$(TERRAFORM) plan -out plan.tfplan

apply:
	$(TERRAFORM) apply -auto-approve 

destory:
	$(TERRAFORM) destroy -auto-approve

clean:
	rm -rf $(TERRAFORM_PATH)/.terraform/*
	rm $(TERRAFORM_PATH)/terraform.lock.hcl
	rm $(TERRAFORM_PATH)/*tfplan
	rm $(TERRAFORM_PATH)/*tfstate*