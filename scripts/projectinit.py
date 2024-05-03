#!/usr/bin/env python3

# A script setup to prep a directory
# As a project

from pathlib import Path
import os 

# Configuration
central_kb_dir = Path.home() / "Shared/knowledgebase"
project_docs_name = "project_kb"


def create_knowledgebase():
    """Create a folder containing project docs
    in a specified central directory, then symlink
    to the project directory."""

    current_dir = Path.cwd()

    kb_project_dir = (
        central_kb_dir / current_dir.name
    )  # Project folder in knowledgebase
    kb_project_dir.mkdir(exist_ok=True)  

    log_file = f"{current_dir.name}-log.md"
    todo_txt = f"{current_dir.name}.todo.txt"
    proj_guide = f"{current_dir.name}-guide.md"

    for file in [log_file, todo_txt, proj_guide]:
        (kb_project_dir / file).touch()  

    project_docs_link = current_dir / project_docs_name
    if not project_docs_link.exists():
        os.symlink(kb_project_dir, project_docs_link)


def create_editor_workspaces():
    """Create and populate editor config files to project directory"""

    current_dir = Path.cwd()

    # Create .sublime-project file in project directory
    sublime_workspace = current_dir / f"{current_dir.name}.sublime-project"
    with sublime_workspace.open("w") as f:
        f.write('{ \n"folders": [\n {\n "path": "."\n }\n]\n}')

    # Create .code-workspace file in project directory
    vscode_workspace = current_dir / f"{current_dir.name}.code-workspace"
    with vscode_workspace.open("w") as f:
        f.write('{\n"folders": [\n{\n"path": "."\n}\n],\n"settings": {}\n}')


def main():
    create_knowledgebase()
    create_editor_workspaces() 


if __name__ == "__main__":
    main()
