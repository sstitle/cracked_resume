#import "templates/awesome/template.typ": *

// datetime.today() automatically uses SOURCE_DATE_EPOCH if set (for Nix builds)
#let today = datetime.today()

// Override page margins to be narrower (wider content area)
#set page(margin: (left: 5mm, right: 5mm, top: 6mm, bottom: 6mm))

// Reduce spacing for compact layout
#set par(spacing: 0.3em)
#show: resume_section => {
  set block(above: 0.3em, below: 0.2em)
  resume_section
}
#show: skill_item => {
  set block(below: 0.2em)
  set pad(top: 1pt)
  skill_item
}
#show: work_experience_item_header => {
  set block(above: 0.3em, below: 0.1em)
  set pad(top: 1pt)
  work_experience_item_header
}
#show: resume_item => {
  set text(size: 9pt)
  set par(leading: 0.4em)
  resume_item
}
#show: education_item => {
  set block(above: 0.3em, below: 0.1em)
  set pad(top: 1pt)
  education_item
}

#show: resume.with(
  author: (
      firstname: "Samuel Struthers", 
      lastname: "Title",
      email: "samstitle@gmail.com", 
      phone: "(+1) 919-710-5430",
      homepage: "samtitle.com",
      github: "github.com/sstitle",
      linkedin: "linkedin.com/in/sam-title-380722107",
      positions: (
        "Robotics Engineer",
        "Software Developer",
        "DevOps Engineer",
      )
  ),
  date: today.display("[month repr:long] [day], [year]")
)

#resume_section("Skills")

#skill_item(
  "Languages",
  (
    strong[Python],
    strong[C++], 
    strong[Go], 
    strong[TypeScript], 
    strong[Shell], 
    strong[JavaScript],
    strong[C],
    strong[Nix],
    strong[Verilog],
  )
)

#skill_item(
  "Frameworks",
  (
    strong[AWS],
    strong[Pulumi],
    strong[Terraform],
    strong[gRPC],
    strong[ROS],
    strong[Qt],
    strong[MFC],
    strong[React],
  )
)

#skill_item(
  "Technologies",
  (
    strong[Distributed microservices],
    strong[event-driven and multithreaded models],
    strong[client-server architecture],
    strong[TCP/IP sockets],
    strong[relational and non-relational databases],
  )
)

#skill_item(
  "Tools",
  (
    strong[Git],
    strong[CMake],
    strong[Docker],
    strong[Bazel],
    strong[Protobuf],
    strong[GDB],
    strong[GCC],
    strong[Clang],
    strong[MSBuild],
    strong[Valgrind],
    strong[UML],
    strong[LATEX],
    strong[Adobe Creative Cloud],
    strong[OnShape],
  )
)

#resume_section("Experience")

#work_experience_item_header(
  "Dirac",
  "Manhattan, NY",
  "Senior Software Engineer",
  "August 2023 - December 2025",
)

#resume_item[
  - *BuildOS:* Developed Python and C++ infrastructure for physics simulation of mechanical rigid body disassembly.
  - Developed distributed microservices architecture using gRPC in Go, TypeScript, Python, and C++.
  - Integrated a new CAD kernel, enabling colored output in the JavaScript front‑end, and added support for 3 additional CAD formats.
  - Achieved 5x faster C++ build times using Nix, CMake, Ninja and sccache.
  - Developed public API implementation for our web SaaS product enabling enterprise customer engagement with OpenAPI and Go.
  - Implemented continuous integration stages for code formatting, linting, unit testing, integration testing and deployment with GitHub actions.
  - Championed team migration from Gitflow to trunk‑based development leading to release cycles going from 3 months to 2 weeks.
  - Maintained live servers with AWS Cloud infrastructure using Lambda, EC2, S3, and DynamoDB.
]

#work_experience_item_header(
  "Nanotronics",
  "Brooklyn, NY",
  "Senior Software Developer",
  "June 2022 - June 2023",
)

#resume_item[
  - *Modular Autoloader:* Developed flexible architecture for implementing new equipment front-end modules for semiconductor manufacturing.
  - Wrote C++ abstractions for robots and sensors used in an AI defect analysis system for microscopic inspection of various substrate materials.
  - Integrated sample-handling robots, external motors, pneumatic components, sensors, and other controls for a microscopic scanning system.
  - Contributed to 4 new product releases with more than 12 new networked hardware components for handling silicon wafers, semiconductor devices, glass and copper panels, and biological specimens.
  - Supported microscope stage size of 650 mm x 650 mm, precisely controllable to 1 μm.
]

#work_experience_item_header(
  "Realtime Robotics",
  "Boston, MA",
  "Robotics Engineer → Senior Software Engineer",
  "July 2018 - February 2022",
)

#resume_item[
  - *RapidPlan Create:* Developed 2.0 version of the company's core robot motion-planning product which streamlined the user workflow and increased the modeling accuracy of our state-of-the-art collision checking technology.
  - *RapidSense:* Developed a GUI for performing extrinsic and intrinsic calibration of multiple RGBD cameras relative to a robotic arm to generate voxel images. Enabled visualization of voxel images accurate to the centimeter at a resolution of 128³ at 10Hz.
  - *World Builder:* Developed a point-and-click robot workstation modeling prototype. Integrated differential evolution AI algorithm for optimizing robot workcells imported from 3rd party applications. Curated a database of over 60 different robot models from 7 different OEMs.
  - Implemented architectural improvements which scaled our system from supporting control of only up to 4 robots to control of up to 16 robots. Optimized memory size of saved project data by enabling implicit sharing on key classes. Achieved a 2-16x reduction in the number of user workflow steps for multi-robot work cells.
]

#resume_section("Education")

#education_item[
  Brown University
][
  Bachelor of Science in Computer Engineering
][
  #resume_location[Providence, RI]
][
  Class of 2018
]

#resume_item[
  *Courses:* Design of Robotic Systems, Collaborative Robotics, Industrial Machine Vision, Design of Computing Systems, Instrumentation Design, Communication Systems, Digital Signal Processing
]
