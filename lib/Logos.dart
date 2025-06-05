String getImageFromCategory(String category) {
  switch (category.toLowerCase()) {
    case 'java':
      return 'https://cdn-icons-png.flaticon.com/512/226/226777.png';
    case 'c++':
      return 'https://cdn-icons-png.flaticon.com/512/6132/6132222.png';
    case 'c':
      return 'https://img.icons8.com/?size=100&id=40670&format=png&color=000000';
    case 'c#':
      return 'https://cdn-icons-png.flaticon.com/512/6132/6132221.png';
    case 'javascript':
      return 'https://cdn-icons-png.flaticon.com/512/5968/5968292.png';
    case 'dart':
      return 'https://img.icons8.com/?size=100&id=7AFcZ2zirX6Y&format=png&color=000000';
    case 'python':
      return 'https://cdn-icons-png.flaticon.com/512/5968/5968350.png';
    case 'swift':
      return 'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/swift-programming-language-icon.png';
    case 'sql':
      return 'https://cdn-icons-png.flaticon.com/128/16781/16781152.png';
    case 'go':
      return 'https://go.dev/blog/go-brand/Go-Logo/PNG/Go-Logo_Aqua.png';
    case 'rust':
      return 'https://www.rust-lang.org/logos/rust-logo-512x512.png';
    case 'kotlin':
      return 'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/kotlin-programming-language-icon.png';
    case 'php':
      return 'https://cdn-icons-png.flaticon.com/512/919/919830.png';
    case 'ruby':
      return 'https://cdn-icons-png.flaticon.com/512/919/919842.png';
    case 'typescript':
      return 'https://cdn-icons-png.flaticon.com/512/5968/5968381.png';
    case 'scala':
      return 'https://img.icons8.com/?size=100&id=FIdVBOahSJu0&format=png&color=000000';
    case 'perl':
      return 'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/perl-programming-language-icon.png';
    case 'r':
      return 'https://www.r-project.org/logo/Rlogo.png';
    case 'html & css':
      return 'https://cdn-icons-png.flaticon.com/512/1051/1051277.png';
    case 'operating system':
      return 'https://cdn-icons-png.flaticon.com/128/6124/6124995.png';
    default:
      return 'https://cdn-icons-png.flaticon.com/512/565/565547.png'; // Default image
  }
}
