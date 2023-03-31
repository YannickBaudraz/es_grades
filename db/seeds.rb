City.create!(name: 'Zürich', zip: 8000)
City.create!(name: 'Prilly', zip: 1008)

print "Creating roles...\n"
admin_role = Role.create!(slug: 'admin', name: "Administrator")
user_role = Role.create!(slug: "user", name: "User")

print "Creating users...\n"
teacher_user = Teacher.create!(first_name: "Teacher", last_name: "Teacher", email: "teacher@cpnv.ch", password: "password", password_confirmation: "password", roles: [admin_role], city: City.second)
student_user = Student.create!(first_name: "Student", last_name: "Teacher", email: "student@cpnv.ch", password: "password", password_confirmation: "password", roles: [user_role], city: City.last)
student1 = Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", roles: [user_role])
student2 = Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", roles: [user_role])

print "Creating semesters...\n"
semester1 = Semester.create!(started_at: Date.new(2020, 9, 1), ended_at: Date.new(2021, 1, 31))
semester2 = Semester.create!(started_at: Date.new(2021, 2, 1), ended_at: Date.new(2021, 6, 30))
semester3 = Semester.create!(started_at: Date.new(2021, 7, 1), ended_at: Date.new(2021, 12, 31))

print "Creating quarters...\n"
quarter1 = Quarter.create!(started_at: Date.new(2020, 9, 1), ended_at: Date.new(2020, 12, 31), semester: semester1)
quarter2 = Quarter.create!(started_at: Date.new(2021, 1, 1), ended_at: Date.new(2021, 3, 31), semester: semester1)
quarter3 = Quarter.create!(started_at: Date.new(2021, 4, 1), ended_at: Date.new(2021, 6, 30), semester: semester2)
quarter4 = Quarter.create!(started_at: Date.new(2021, 7, 1), ended_at: Date.new(2021, 9, 30), semester: semester3)
quarter5 = Quarter.create!(started_at: Date.new(2021, 10, 1), ended_at: Date.new(2021, 12, 31), semester: semester3)

print "Creating promotions...\n"
promotion1 = Promotion.create!(name: "Promotion 2021/2022", started_at: Date.new(2021, 9, 1), ended_at: Date.new(2022, 6, 30))
promotion2 = Promotion.create!(name: "Promotion 2022/2023", started_at: Date.new(2022, 9, 1), ended_at: Date.new(2023, 6, 30))

print "Creating categories...\n"
general_modules = Category.create!(slug: 'general_modules', name: 'Modules généraux', parent: nil)
specific_modules = Category.create!(slug: 'specific_modules', name: 'Modules spécifiques', parent: nil)
dev_modules = Category.create!(slug: 'dev_modules', name: 'Modules de développement', parent: specific_modules)
web_dev_modules = Category.create!(slug: 'web_dev_modules', name: 'Modules de développement web', parent: specific_modules)
database_modules = Category.create(slug: 'database_modules', name: 'Modules liés aux bases de données', parent: specific_modules)
system_modules = Category.create(slug: 'system_modules', name: 'Modules système', parent: specific_modules)
experience_modules = Category.create(slug: 'prof_exp', name: 'Modules d\'application et expérience professionnelle', parent: nil)
projects_and_internships = Category.create(slug: 'proj_intern', name: 'Projets et stages en entreprise', parent: experience_modules,)
internship = Category.create(slug: 'internship', name: 'Stages Techniciens', parent: experience_modules)
general_branches = Category.create(slug: 'general_branches', name: 'Branches générales', parent: nil)

print "Creating courses...\n"
print "Creating dev courses...\n"
uml = Course.create!(slug: 'UML1', title: 'UML1', description: 'Modéliser des applications Web en UML, processus de développement', category: dev_modules, quarter: quarter1, promotion: promotion2)
poo1 = Course.create!(slug: 'POO1', title: 'POO1', description: 'Concepts MVC avancés. Utilisation d’un ORM.', category: dev_modules, quarter: quarter1, promotion: promotion2)
jav1 = Course.create!(slug: 'JAV1', title: 'JAV1', description: 'Créer des applications Android en JAVA', category: dev_modules, quarter: quarter1, promotion: promotion2)
poo2 = Course.create!(slug: 'POO2', title: 'POO2', description: 'Algorithmes et structures de données, Design Patterns, Test Driven Development', category: dev_modules, quarter: quarter1, promotion: promotion2)
hkg1 = Course.create!(slug: 'HKG1', title: 'HKG1', description: 'Cross-site scripting, injection SQL', category: dev_modules, quarter: quarter1, promotion: promotion2)

print "Creating web dev courses...\n"
prw1 = Course.create!(slug: 'PRW1', title: 'PRW1', description: 'Programmation Web : XHTML, CSS, Javascript, PHP', category: web_dev_modules, quarter: quarter1, promotion: promotion2)
gui1 = Course.create!(slug: 'GUI1', title: 'GUI1', description: 'Techniques de conception et réalisation d\'interfaces utilisateur', category: web_dev_modules, quarter: quarter1, promotion: promotion2)
gui2 = Course.create!(slug: 'GUI2', title: 'GUI2', description: 'Pratique de conception et réalisation d\'interfaces utilisateur', category: web_dev_modules, quarter: quarter1, promotion: promotion2)
prw2 = Course.create!(slug: 'PRW2', title: 'PRW2', description: 'Programmation PHP : POO, MVC et frameworks', category: web_dev_modules, quarter: quarter1, promotion: promotion2)
ria1 = Course.create!(slug: 'RIA1', title: 'RIA1', description: 'Rich Internet Application : Services web, microformats, Ajax, JS et librairies', category: web_dev_modules, quarter: quarter1, promotion: promotion2)
mob1 = Course.create!(slug: 'MOB1', title: 'MOB1', description: 'Applications mobiles en framework hybride (Ionic, React, Flutter)', category: web_dev_modules, quarter: quarter1, promotion: promotion2)
awa1 = Course.create!(slug: 'AWA1', title: 'AWA1', description: 'Advanced Web Animations', category: web_dev_modules, quarter: quarter1, promotion: promotion2)

print "Creating database courses...\n"
sql1 = Course.create(slug: "SQL1", title: "SQL1", description: "Manipuler des données à l'aide de SQL et modélisation des données", category: database_modules, quarter: quarter1, promotion: promotion2)
nos1 = Course.create(slug: "NOS1", title: "NOS1", description: "Bases de de données NOSQL", category: database_modules, quarter: quarter1, promotion: promotion2)
sql2 = Course.create(slug: "SQL2", title: "SQL2", description: "SQL Server : Installation, configuration, programmation T-SQL", category: database_modules, quarter: quarter1, promotion: promotion2)
bi1 = Course.create(slug: "BI1", title: "BI1", description: "Business Intelligence", category: database_modules, quarter: quarter1, promotion: promotion2)

print "Creating system courses...\n"
cld1 = Course.create(slug: "CLD1", title: "CLD1", description: "Linux: Système de fichiers et Administration de base + mise en place hébergement Web mutualisé", category: system_modules, quarter: quarter1, promotion: promotion2)
daw = Course.create(slug: "DAW", title: "DAW", description: "Déploiement d’Application Web en Local (DAW)", category: system_modules, quarter: quarter1, promotion: promotion2)
cld2 = Course.create(slug: "CLD2", title: "CLD2", description: "Modification et déploiement de solutions dans le cloud, serverless", category: system_modules, quarter: quarter1, promotion: promotion2)
vir1 = Course.create(slug: "VIR1", title: "VIR1", description: "Administration d’une plateforme de virtualisation", category: system_modules, quarter: quarter1, promotion: promotion2)

print "Creating project courses...\n"
gpr1 = Course.create(slug: "GPR1", title: "GPR1", description: "Gestion de projet + éthique et culture d'entreprise", category: projects_and_internships, quarter: quarter1, promotion: promotion2)
itil_com = Course.create(slug: "ITIL_COM", title: "ITIL_COM", description: "ITIL", category: projects_and_internships, quarter: quarter1, promotion: promotion2)
maw_1_1 = Course.create(slug: "MAW1.1", title: "MAW1.1", description: "E-commerce", category: projects_and_internships, quarter: quarter1, promotion: promotion2)
maw_1_2_communication = Course.create(slug: "MAW1.2_com", title: "MAW1.2 Communication", description: "Framework", category: projects_and_internships, quarter: quarter1, promotion: promotion2)
maw_1_2_technical = Course.create(slug: "MAW1.2_tech", title: "MAW1.2 Technique", description: "Framework", category: projects_and_internships, quarter: quarter1, promotion: promotion2)

print "Creating general courses...\n"
physics = Course.create(slug: "PHY", title: "Physique", category: general_branches, quarter: quarter1, promotion: promotion2)
maths = Course.create(slug: "MATH", title: "Mathématiques", category: general_branches, quarter: quarter1, promotion: promotion2)
english = Course.create(slug: "ANG", title: "Anglais", category: general_branches, quarter: quarter1, promotion: promotion2)
french = Course.create(slug: "FR", title: "Français", category: general_branches, quarter: quarter1, promotion: promotion2)
economy = Course.create(slug: "GEO", title: "Gestion et Organisation", category: general_branches, quarter: quarter1, promotion: promotion2)

print "Creating a custom course for a teacher...\n"
custom_course = Course.create(slug: 'tcc', title: 'Teacher Custom Course', description: 'Advanced Web Animations', category: web_dev_modules, quarter: quarter1, teachers: [teacher_user], promotion: promotion2)

print "Adding promotions to students...\n"
student1.promotions << promotion1
student1.save!

student2.promotions << promotion1
student2.save!

student_user.promotions << promotion2

print "Creating teachers and assigning them to courses...\n"
number_of_courses = Course.count
teachers = []
courses = []
0.upto(number_of_courses - 1) do |i|
  course = Course.order(:id).limit(1).offset(i).first
  teacher = Teacher.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", roles: [user_role])
  course.teachers << teacher
  course.save!

  teachers << teacher
  courses << course
end

print "Creating an exam for each course...\n"
0.upto(number_of_courses - 1) do |i|
  exam = Exam.create!(name: Faker::Company.name, weight: Faker::Number.between(from: 0.1, to: 3.0), teacher: teachers.sample, course: courses.sample)
  exam.save!
end

print "Creating evaluations for each exam...\n"
exams = Exam.all
exams.each do |exam|
  Evaluation.create!(student: student_user, teacher: teachers.sample, exam: exam, grade: Faker::Number.between(from: 1.0, to: 6.0))
end
