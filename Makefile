#SHELL := /bin/bash

default: populate_dbt_profile_file init_dbt_project setup_dbt_project_file validate_conn run_model test_model document_model

#create environment variables (needed for 'setup_dbt_profile')
export DBT_PROJECT_NAME=${DBT_PROJ_NAME}
export DBT_PROFILE_NAME=${DBT_PROF_NAME}
export DBT_MODEL_NAME=${MODEL_NAME}
export SNOWFLAKE_ACCOUNT=${SF_ACC}
export SNOWFLAKE_DB=${SF_DB}
export SNOWFLAKE_WH=${SF_WH}
export SNOWFLAKE_SCHEMA=${SF_SCH}
export SNOWFLAKE_USER=${SNOWSQL_USER}
export SNOWFLAKE_PASS=${SNOWSQL_PWD}
export SNOWFLAKE_ROLE=${SF_ROLE}

deps:
	$(info [+] Install dependencies (dbt))
	pip install dbt
	brew install gettext
	brew link --force gettext
	brew install gnu-sed

create_git_repo:
	echo "create a git repo here"
	git add Makefile
	git add templates/
	git add profiles/.gitignore
	git add .gitignore

populate_dbt_profile_file:
	$(info [+] populate profiles/profiles.yml)
	@[ "${DBT_PROJECT_NAME}" ] || ( echo "\nError: DBT_PROJECT_NAME variable is not set\n"; exit 1 )
	@[ "${DBT_PROFILE_NAME}" ] || ( echo "\nError: DBT_PROFILE_NAME variable is not set\n"; exit 1 )
	@[ "${DBT_PROFILE_NAME}" ] || ( echo "\nError: DBT_PROFILE_NAME variable is not set\n"; exit 1 )
	@[ "${DBT_MODEL_NAME}" ] || ( echo "\nError: DBT_MODEL_NAME variable is not set\n"; exit 1 )
	@[ "${SNOWFLAKE_DB}" ] || ( echo "\nError: SNOWFLAKE_DB variable is not set\n"; exit 1 )
	@[ "${SNOWFLAKE_WH}" ] || ( echo "\nError: SNOWFLAKE_WH variable is not set\n"; exit 1 )
	@[ "${SNOWFLAKE_SCHEMA}" ] || ( echo "\nError: SNOWFLAKE_SCHEMA variable is not set\n"; exit 1 )
	@[ "${SNOWFLAKE_USER}" ] || ( echo "\nError: SNOWFLAKE_USER variable is not set\n"; exit 1 )
	@[ "${SNOWFLAKE_ROLE}" ] || ( echo "\nError: SNOWFLAKE_ROLE variable is not set\n"; exit 1 )
	@[ "${SNOWFLAKE_PASS}" ] || ( echo "\nError: SNOWFLAKE_PASS variable is not set\n"; exit 1 )
	@envsubst < templates/profiles.yml > profiles/profiles.yml

init_dbt_project:
	$(info [+] Initialise dbt project)
	@dbt init ${DBT_PROJECT_NAME} --profiles-dir=profiles
	#copy profiles and model dirs into project folder
	@cp -r profiles/ ${DBT_PROJECT_NAME}/profiles
	@cp -r models/ ${DBT_PROJECT_NAME}/models
	#copy schema.yml (data model tests) to project folder
	cp schema.yml ${DBT_PROJECT_NAME}/models
	#add entries to the generated .gitignore
	@cp .gitignore ${DBT_PROJECT_NAME}/.gitignore
	@rm -r ${DBT_PROJECT_NAME}/models/example

setup_dbt_project_file:
	$(info [+] generate profiles.yml inside project folder file)
	#change profile name in dbt_project.yml file
	@sed -i -e 's/default/${DBT_PROFILE_NAME}/g' ${DBT_PROJECT_NAME}/dbt_project.yml
	@sed -i -e 's/my_new_project/${DBT_PROJECT_NAME}/g' ${DBT_PROJECT_NAME}/dbt_project.yml
	#replace the models reference
	@sed -i -z -E 's/# Applies to all files under models\/example\/\n      example:\n          materialized: view/${DBT_MODEL_NAME}:\n          +materialized: view/g' ${DBT_PROJECT_NAME}/dbt_project.yml

validate_conn:
	cd ${DBT_PROJECT_NAME} && dbt debug --profiles-dir=profiles

run_model:
	cd ${DBT_PROJECT_NAME} && dbt run --profiles-dir profiles --models ${DBT_MODEL_NAME}

test_model:
	#prerequisite: populate agdf/models/schema.yml with any desired tests
	cd ${DBT_PROJECT_NAME} && dbt test --profiles-dir profiles --models ${DBT_MODEL_NAME}

document_model:
	cd ${DBT_PROJECT_NAME} && dbt docs generate --profiles-dir profiles --models ${DBT_MODEL_NAME}
	cd ${DBT_PROJECT_NAME} && dbt docs serve --profiles-dir profiles

###############
# Dev scripts
###############
del_project:
	@rm -r ${DBT_PROJECT_NAME}
	@rm profiles/profile.yml
	@rm profiles/.user.yml

debug:
	cd ${DBT_PROJECT_NAME} && dbt debug --profiles-dir=profiles
