[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/mzu0upNX)
# Project: Infrastructure Automation with Ansible

## Overview

This project aims to apply and extend your Ansible skills by automating server setup and configuration, implementing file synchronization with Unison, and ensuring high code quality with `ansible-lint`. This hands-on project will solidify your understanding of infrastructure as code principles.

## Objectives

- Automate server setup and configuration using Ansible.
- Implement file synchronization across servers with [Unison file synchronizer](https://github.com/bcpierce00/unison).
- Ensure playbooks adhere to best practices with `ansible-lint`.

## Requirements

### General

- Participants may work individually or in pairs. For pair projects, it is mandatory for both members to actively contribute by committing to the repository with their respective accounts. This practice is crucial for demonstrating each member's contribution and will be assessed programmatically.
- To qualify for a higher grade (Väl Godkänt), both the project and all related individual assignments must be submitted by their respective deadlines. Submissions after the deadline will only be considered for a passing grade (Godkänt), regardless of the project's quality or completeness.
- Ensure that your work is organized logically, with each significant change committed separately and accompanied by a clear, descriptive message. For guidance on crafting effective commit messages, refer to [Good Commit Messages](https://cbea.ms/git-commit/).

### Basic Requirements (Godkänt)

1. Utilize three Ubuntu Server VMs. The initial SSH key setup, required for Ansible to establish connections with the hosts, must be performed manually. All other configurations, including the deployment of a separate set of SSH keys for the `sync2` account's use, must be automated via Ansible.
2. Build upon "Assignment 6 - Ansible Continuation."
3. Synchronize files using Unison. Designate one VM as passive (central sync point) and the other two as active. Sync directory: `/boxydrop`.
4. Run Unison under the `sync2` user, ensuring it has the necessary directory permissions.
5. Schedule Unison with cron to run every minute.
6. Define machine roles (passive vs. active) using Ansible groups, [roles](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html), or inventory variables—no hard-coded hostnames.
7. Ensure `ansible-lint` passes without errors. The error it shows for `state: latest` in the package update task may be ignored using a `noqa`-comment at the end of the offending line. Example:

```yaml
- name: Update cache and all packages
  ansible.builtin.apt:
  update_cache: true
  name: "*"
  state: latest # noqa: package-latest
```

### Advanced Requirements (Väl Godkänt)

8. Structure your Ansible playbook into at least two plays, maintaining a single playbook.
9. Install and configure Docker on one of the hosts using Ansible. Specify the host with a [role](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html)
10. Deploy a Docker container (containing any software of your choice) that can let the user add files to `/boxydrop` using a web interface.
11. Adjust and assert that the permissions on `/boxydrop` makes it possible for the Unison replication to keep working while also allowing the Docker container software to add files.

**Software examples for Docker deployment:**

- [PhotoView](https://photoview.github.io/)
- [FileBrowser](https://filebrowser.org/)

## Tools and Technologies

- Ansible
- Unison
- `ansible-lint`
- Docker (for Advanced Requirements for Väl Godkänt)

## Submission Guidelines

1. **Deadline**: 2024-02-14, 23:59. Reporting sessions follow the next day.
2. **Group Submissions**: Ensure each member commits using their account.
3. **Checks**:
   1. Include all relevant files in your repository such as playbooks, inventory, roles, etc.
   2. SSH into all nodes, navigate to `/boxydrop`, and execute
   ```bash
      while true; do sleep 15; date; ls; done
   ```
   3. Upload a file to an active machine and capture a screenshot showing the file's propagation.
   4. Show a screenshot of `ansible-lint yourplaybook.yml` with no errors
   5. **Advanced Requirements**: Include a screenshot of the Docker-deployed software with uploaded files visible in a web browser.

## Resources

- [Unison File Synchronizer Tutorials](https://www.youtube.com/results?search_query=unison+file+synchronizer)
- [Crontab in Ubuntu](https://www.youtube.com/results?search_query=crontab+ubuntu)
- [Ansible-Lint Documentation](https://ansible.readthedocs.io/projects/lint/)
- [Good Commit Messages Guide](https://cbea.ms/git-commit/)
- [Ansible Examples](https://github.com/nackc8/ansible-examples)
