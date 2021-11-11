class PostMailer < ApplicationMailer
	def new_post_email
	debugger
    @post = params[:post]
	attachments["post_#{@post.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'post', template: '\posts/generate_pdf.html.erb', layout: 'pdf.html')
    )

   # attachments["todo_#{todo.id}.pdf"] = WickedPdf.new.pdf_from_string(
   #    render_to_string(pdf: 'todo', template: 'todo.pdf.erb', layout: 'pdf.html'), { :hash_with_wickedpdf_options }
   #  )
    mail(to: "shantanun@witmates.com", subject: "You have created new post")
  end
end	
