import {Command, Flags} from '@oclif/core'
import {Octokit} from '@octokit/rest'

const octokit = new Octokit({auth: process.env.ATLAS_ACCESS_TOKEN})

export default class search extends Command {
  static description = 'Search for a Terraform template'

  static flags = {
    version: Flags.string({char: 'v', description: 'version of the template'}),
    service: Flags.string({char: 's', description: 'AWS service for the template'}),
  }

  async run() {
    const parsed = await this.parse(search)
    const version = parsed.flags.version
    const service = parsed.flags.service

    if (!version || !service) {
      this.error('Please provide both version and service flags.')
      return
    }

    const filePath = `aws/${service}/${version}/${service}.tf`
    this.log(`Searching for Terraform template: ${filePath}`)

    try {
        const response = await octokit.repos.getContent({
          owner: 'BeeTech-global',
          repo: 'atlas-templates',
          path: filePath,
        })
        if ('content' in response.data) {
          const content = Buffer.from(response.data.content, 'base64').toString('utf8')
          this.log(content)
        } else {
          this.error('No content found in the response.')
        }
      } catch (error) {
        if (error instanceof Error) {
          this.error(`Error Searching Terraform template: ${error.message}`)
        } else {
          this.error('Error Searching Terraform template.')
        }
      }
  }
}
