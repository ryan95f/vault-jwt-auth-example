TERRAFORM_PATH = terraform
TERRAFORM = terraform -chdir=$(TERRAFORM_PATH)/

TF_VARIABLES = variables.tfvars
TF_PLAN = plan.tfplan

.PHONY: plan apply

plan:
	$(TERRAFORM) init
	$(TERRAFORM) plan -var-file=$(TF_VARIABLES) -out $(TF_PLAN)

apply:
	$(TERRAFORM) apply -auto-approve $(TF_PLAN)

destroy:
	$(TERRAFORM) destroy -var-file=$(TF_VARIABLES) -auto-approve

clean:
	rm -rf $(TERRAFORM_PATH)/.terraform/*
	rmdir $(TERRAFORM_PATH)/.terraform
	rm $(TERRAFORM_PATH)/.terraform.lock.hcl
	rm $(TERRAFORM_PATH)/*tfplan
	rm $(TERRAFORM_PATH)/*tfstate*