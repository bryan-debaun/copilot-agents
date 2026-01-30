# MCP Tool Opportunities & Guidance

This document describes when and how to propose or create MCP (Model Context Protocol) tools for repository workflows.

## When to suggest an MCP tool

- Repetitive manual tasks (e.g., checking issue status, fetching specific data)
- External API integrations where common operations could be exposed as a tool
- Workflow enhancements that would benefit from an agent-available operation (deployment triggers, environment checks)
- Reusable data retrieval patterns across sessions

## Benefits

- Learning opportunities for MCP protocol and tool design
- Workflow automation and improved efficiency
- Reusability across projects
- Portfolio value for demonstrating advanced agent integrations

## How to propose

- Create an issue describing the tool, purpose, potential API surfaces, and success criteria
- Label it `project:mcp-server` for tracking
- Prototype a small POC and attach results to the issue
- If approved, add the tool to the MCP server and update agent docs

## Example text to propose

"This workflow could be enhanced with an MCP tool. Should I create an issue for building a `[tool-name]` tool that [description]?"

## Current MCP server

- `bryan-debaun/mcp-server` — check existing tools before proposing duplicates
- Reference: <https://github.com/bryan-debaun/mcp-server>
