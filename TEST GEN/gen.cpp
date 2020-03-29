//#include "jngen.h"          //INCLUDE THIS FILE FOR TREE/GRAPH GENERATION
#include "bits/stdc++.h"
using namespace std ;

#define timesaver ios_base::sync_with_stdio(0);cin.tie(0);cout.tie(0);

typedef long long ll ;
typedef long double ldb ;

#define mp make_pair
#define pb push_back
#define F first
#define S second
#define nl '\n'

#define all( x ) x.begin(),x.end() 
#define sz( x ) ( int )( x ).size( )
#define mem( a, val ) memset(a, val, sizeof( a ) )
#define deci( x ) cout<<fixed<<setprecision( x );
#define bitcount( x ) __builtin_popcountll( x )

const int dx[8] = {-1, -1, -1, 0, 1, 1, 1, 0};
const int dy[8] = {-1, 0, 1, 1, 1, 0, -1, -1};

const int MAX = 1000*100 + 10 ;
const ll INF = 1e18 ;
const int MOD = 1e9 + 7 ;

mt19937_64 rng(chrono::steady_clock::now().time_since_epoch().count());

ll t_no ;
ll n, k ;
ll nlo, nhi ;
ll vlo, vhi ;
ll tlo, thi ;
ll klo, khi ;

void getn( ){
  cin >> t_no ;
  if( t_no < 5 ){
    nlo = 1, nhi = 100 ;
    vlo = 1, vhi = 600 ;
    tlo = 1, thi = 10 ;
  }
  else if( t_no < 12 ){
    nlo = 900, nhi = 1000 ;
    vlo = 1, vhi = 10000 ;
    tlo = 1, thi = 20 ;
  }
  else if( t_no < 15 ){
    nlo = 5000, nhi = 10000 ;
    vlo = 1, vhi = 100000 ;
    tlo = 40, thi = 50 ;
  }
  else{
    nlo = 100000, nhi = 100000 ;
    vlo = 100000, vhi = 1e6 ;
    tlo = 50, thi = 50 ;
  }

  uniform_int_distribution< ll >ngen( nlo, nhi ) ; 
  n = ngen( rng ) ;

}

// RANDOM TREES
// Tree t ;

// void gett( ){
//   if( t_no < 5 ){
//     t = Tree::random( n ) ; 
//   }
//   else if( t_no < 12 ){
//     t = Tree::randomKruskal( n ) ;
//   }
//   else if( t_no == 14 ){
//   	t = Tree::bamboo( n ) ;
//   }
//   else if( t_no < 15 ){
//     t = Tree::caterpillar( n, 10 ) ;
//   }
//   else if( t_no < 17 ){
//   	t = Tree::randomKruskal( n ) ;
//   }
//   else{
//     t = Tree::randomPrim( n, 10000 ) ;
//   }
// }

int main( ){
  timesaver ;
  getn();
  gett();
  uniform_int_distribution< ll >vgen( vlo, vhi ) ;
  cout << n << nl ;
  vector< int > v ;
  for( int i = 1 ; i <= n ; i++ )
  	v.pb( vgen(rng) ) ;
  for( int i : v )
  	cout << i << " " ;
  cout << nl ;
  cout << t.add1( ) << nl ;
}
