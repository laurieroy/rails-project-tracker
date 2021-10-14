require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
	describe 'GET /projects' do
		before do
			proj1 = create(:project, title: 'title1', created_by: 'creator1')
			proj2 = create(:project, title: 'title2', created_by: 'creator2')
		end

		it 'returns all projects' do
			get '/api/v1/projects'

			expect(response).to have_http_status(:success)
			expect(JSON.parse(response.body).size).to eq(2)
		end
	end

	describe 'POST /projects' do
		it 'creates a new project' do
			expect {
				post '/api/v1/projects', params: { project: {title: 'title', created_by: 'author'}}
			}.to change { Project.count}.from(0).to(1)

			expect(response).to have_http_status(:created)
		end
	end

	describe 'DELETE /projects/:id' do
		let!(:project) { create(:project, title: 'title1', created_by: 'creator1')}

		it 'deletes a project' do
			expect {
				delete "/api/v1/projects/#{project.id}"
			}.to change { Project.count }.from(1).to(0)

			expect(response).to have_http_status(:no_content)
		end
	end
	

end